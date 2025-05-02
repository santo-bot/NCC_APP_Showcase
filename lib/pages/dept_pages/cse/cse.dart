import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nccapp/CustomShapes/listcard.dart';
import 'package:nccapp/constants/colors.dart';
import 'package:nccapp/pages/dept_pages/cse/sem1.dart';
import 'package:nccapp/pages/dept_pages/cse/sem2.dart';
import 'package:nccapp/pages/dept_pages/cse/sem3.dart';
import 'package:nccapp/pages/dept_pages/cse/sem4.dart';

class CSE extends StatelessWidget {
  const CSE({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,  // Define the number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('CSE Resources'),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.blue, // Color of the tab indicator
            tabs: [
              Tab(text: 'Sem 1'),
              Tab(text: 'Sem 2'),
              Tab(text: 'Sem 3'),
              Tab(text: 'Sem 4'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Semester1Page(),
            Semester2Page(),
            Semester3Page(),
            Semester4Page(),
          ],
        ),
      ),
    );
  }
}

// Sample Pages for each Semester



