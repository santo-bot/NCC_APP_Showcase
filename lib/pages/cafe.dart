import 'package:flutter/material.dart';

class CafeteriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cafeteria Queue')),
      body: Column(
        children: [
          const Text('Current Queue: 15 students'),
          ElevatedButton(
            onPressed: () {
              // Pre-order food action
            },
            child: const Text('Pre-order Food'),
          ),
        ],
      ),
    );
  }
}
