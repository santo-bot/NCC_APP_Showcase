import 'package:flutter/material.dart';
import 'package:nccapp/CustomShapes/list_card_small.dart';
import 'package:nccapp/pages/dept_pages/cse/sem1_res/list_notes/noteslist.dart';
import 'package:nccapp/pages/dept_pages/pdfview.dart';

import '../../../../CustomShapes/listcard.dart';

class NotesCS extends StatelessWidget {
  const NotesCS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [

              listcard_small(
                title: "Fundamentals of  Computer and Computing",
                cardImage: 'assets/images/fcc.jpeg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>List_Notes_FCC_1()));
                },
              ),

              listcard_small(
                title: "Discrete Mathematics",
                cardImage: 'assets/images/dm.webp',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/notes.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),

              listcard_small(
                title: "Math",
                cardImage: 'assets/images/math.jpeg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/notes.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),

              listcard_small(
                title: "Chemistry",
                cardImage: 'assets/images/chemistry.jpeg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/notes.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),


              listcard_small(
                title: "Electrical Circuits",
                cardImage: 'assets/images/circuit.png',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/notes.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
