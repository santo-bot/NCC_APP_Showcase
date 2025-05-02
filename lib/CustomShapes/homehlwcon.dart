import 'package:flutter/material.dart';

class HomeCont extends StatelessWidget {
  final String username;
  final String searchQuery;  // Declare searchQuery
  final Function(String) onSearchChanged;  // Declare onSearchChanged callback

  const HomeCont({
    Key? key,
    required this.username,
    required this.searchQuery,  // Add searchQuery to the constructor
    required this.onSearchChanged,  // Add onSearchChanged to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 4), // shadow only on bottom
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome,', // Display username
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),


          Text(
             '$username', // Display username
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Let’s make campus life easier!',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          // Search bar
          TextField(
            onChanged: (value) {
              onSearchChanged(value);  // Call the onSearchChanged callback
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          // Optional: Display searchQuery if it's not empty
          if (searchQuery.isNotEmpty)
            Text(
              'Searching for: $searchQuery',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
        ],
      ),
    );
  }
}
