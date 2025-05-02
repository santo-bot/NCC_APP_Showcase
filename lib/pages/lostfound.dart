import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LostAndFoundPage extends StatefulWidget {
  @override
  _LostAndFoundPageState createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();

  // List to hold the reported lost items
  List<String> reportedItems = [];

  @override
  void initState() {
    super.initState();
    _fetchReportedItems();  // Fetch the reported items when the page is loaded
  }

  // Function to fetch reported lost items from the backend
  Future<void> _fetchReportedItems() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/lostandfound/items/');  // URL to your Django API
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server returns a successful response
      final List<dynamic> data = jsonDecode(response.body);  // Decode the JSON response

      setState(() {
        // Map the data to a list of strings (item descriptions)
        reportedItems = data.map((item) => item['description'] as String).toList();
      });
    } else {
      print(response.body);  // Print error message for debugging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch reported items: ${response.statusCode}')),
      );
    }
  }

  // Function to report a lost item
  Future<void> _reportLostItem() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/lostandfound/items/');  // URL to your Django API
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": _titleController.text.trim(),  // Include title
        "description": _itemController.text.trim(),  // Include description
      }),
    );

    if (response.statusCode == 201) {
      setState(() {
        reportedItems.insert(0, _itemController.text.trim());  // Add the item to the list
        _itemController.clear();  // Clear the item description field
        _titleController.clear();  // Clear the title field
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item reported')),
      );
    } else {
      print(response.body);  // Print error message for debugging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to report item: ${response.statusCode}')),
      );
    }
  }

  // Widget to display the reported lost items
  Widget _buildReportedItems() {
    return ListView.builder(
      itemCount: reportedItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(reportedItems[index]),  // Display the reported lost item
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost and Found'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Enter item title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _itemController,
              decoration: const InputDecoration(hintText: 'Describe the lost item'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reportLostItem,
              child: const Text('Report Lost Item'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Reported Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: _buildReportedItems(),  // Display the list of reported items
            ),
          ],
        ),
      ),
    );
  }
}
