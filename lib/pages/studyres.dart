import 'package:flutter/material.dart';
import 'package:nccapp/CustomShapes/listcard.dart';
import 'package:nccapp/pages/dept_pages/cse/cse.dart';

class StudyResourcesPage extends StatefulWidget {
  @override
  _StudyResourcesPageState createState() => _StudyResourcesPageState();
}

class _StudyResourcesPageState extends State<StudyResourcesPage> {
  final List<String> resources = [];

  void _addResource(String resource) {
    setState(() {
      resources.add(resource);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Study Resources'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    listcard(
                      title: 'Computer Science\nand Engineering',
                      subtitle: '(All Semester Resources)',
                      cardImage: 'assets/images/computer.jpg',
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CSE()));
                      },
                    ),
                    const SizedBox(height: 10),
                    listcard(
                      title: 'Electrical and\nElectronics Engineering',
                      subtitle: '(All Semester Resources)',
                      cardImage: 'assets/images/eee.jpeg',
                      onpressed: () {},
                    ),
                    const SizedBox(height: 10),
                    listcard(
                      title: 'Textile Engineering',
                      subtitle: '(All Semester Resources)',
                      cardImage: 'assets/images/te.webp',
                      onpressed: () {},
                    ),
                    const SizedBox(height: 10),
                    listcard(
                      title: 'Industrial and Production Engineering',
                      subtitle: '(All Semester Resources)',
                      cardImage: 'assets/images/ipe.jpg',
                      onpressed: () {},
                    ),

                    const SizedBox(height: 10),
                    listcard(
                      title: 'Fashion Design and Aparrel Engineering',
                      subtitle: '(All Semester Resources)',
                      cardImage: 'assets/images/fdae.jpg',
                      onpressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
