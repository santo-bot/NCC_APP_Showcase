import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nccapp/pages/dept_pages/cse/sem1_res/notes.dart';

import '../../../CustomShapes/listcard.dart';

class Semester2Page extends StatelessWidget {
  const Semester2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            listcard(
              title: 'Class Notes',
              subtitle: 'Clss Notes, and guides',
              cardImage: 'assets/images/notes.png',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesCS()));
              },
            ),
            const SizedBox(height: 10),

            listcard(
              title: 'Reference Books',
              subtitle: 'All Edition Follwed by',
              cardImage: 'assets/images/books.jpeg',
              onpressed: () {
                // Action when tapped
              },
            ),
            const SizedBox(height: 10),

            listcard(
              title: 'Previous Year Final Questions',
              subtitle: 'For all academic year',
              cardImage: 'assets/images/questions.jpeg',
              onpressed: () {
                // Action when tapped
              },
            ),
            const SizedBox(height: 10),

            listcard(
              title: 'Previous year CT questions',
              subtitle: 'For all academic year',
              cardImage: 'assets/images/questions.jpeg',
              onpressed: () {
                // Action when tapped
              },
            ),
            const SizedBox(height: 10),

            listcard(
              title: 'Lab Procedures and Viva',
              subtitle: '',
              cardImage: 'assets/images/lab.jpeg',
              onpressed: () {
                // Action when tapped
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}