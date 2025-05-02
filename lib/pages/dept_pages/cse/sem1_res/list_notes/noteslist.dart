import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nccapp/CustomShapes/list_card_small.dart';
import 'package:nccapp/pages/dept_pages/cse/sem1_res/list_notes/c_programme/C_Basics.dart';

import '../../../../../CustomShapes/listcard.dart';
import '../../../pdfview.dart';

class List_Notes_FCC_1 extends StatelessWidget{
  const List_Notes_FCC_1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Topics"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            listcard_small(
              title: "C Programming",
              cardImage: 'assets/images/c.png',
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> C_basics()));
              },
            ),

            listcard_small(
              title: "Hardware",
              cardImage: 'assets/images/hard.jpeg',
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
    );
  }

}