import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nccapp/constants/colors.dart';
import 'package:nccapp/pages/dept_pages/te.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _locationController = TextEditingController();

  final String apiUrl = 'http://10.0.2.2:8000/api/events/'; // Ensure this is correct
  List<Map<String, dynamic>> events = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    setState(() => isLoading = true);
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        events = List<Map<String, dynamic>>.from(json.decode(response.body));
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      print('Failed to fetch events: ${response.statusCode}');
    }
  }

  Future<void> _addEvent() async {
    if (_titleController.text.trim().isEmpty ||
        _dateController.text.trim().isEmpty ||
        _locationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': _titleController.text.trim(),
        'date': _dateController.text.trim(),
        'location': _locationController.text.trim(),
      }),
    );

    if (response.statusCode == 201) {
      _titleController.clear();
      _dateController.clear();
      _locationController.clear();
      _fetchEvents();  // Refresh events
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event added')),
      );
    } else {
      print('Failed to add event: ${response.statusCode} - ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add event')),
      );
    }
  }

  Future<void> _deleteEvent(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl$id/'));  // Ensure the URL is correct
    if (response.statusCode == 204) {
      setState(() {
        events.removeWhere((event) => event['id'] == id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event deleted')),
      );
    } else {
      print('Failed to delete event: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete event')),
      );
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      _dateController.text = picked.toIso8601String().split('T')[0]; // Format as YYYY-MM-DD
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Form Fields
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Event Title'),
            ),
            GestureDetector(
              onTap: _pickDate,
              child: AbsorbPointer(
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Event Date (YYYY-MM-DD)'),
                ),
              ),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 10),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 50)
              ),
              onPressed: _addEvent,
              child: Text('Add Event',style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
            ),
            SizedBox(height: 20),

            // Event List
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : events.isEmpty
                  ? Center(child: Text('No events yet'))
                  : ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Card(
                    child: ListTile(
                      title: Text(event['title']),
                      subtitle: Text(
                        'Date: ${event['date']} - Location: ${event['location']}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteEvent(event['id']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
