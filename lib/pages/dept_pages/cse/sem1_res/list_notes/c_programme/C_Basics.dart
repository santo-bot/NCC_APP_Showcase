import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../CustomShapes/listcard.dart';
import '../../../../pdfview.dart';

class C_basics extends StatelessWidget{
  const C_basics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C Basic Topics"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              listcard(
                title: "C Basic  ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),
              listcard(
                title: "C Basic 1 ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic1.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),

              listcard(
                title: "C Basic 2 ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic2.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),

              listcard(
                title: "C Basic 3 ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic3.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),
              listcard(
                title: "C Basic 4 ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic4.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),

              listcard(
                title: "C Basic 5 ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic5.pdf',
                    downloadUrl: 'https://yourdomain.com/notes.pdf', // Replace with actual URL
                    fileName: 'notes.pdf',
                  ),));
                },
              ),

              listcard(
                title: "C Basic 6 ",
                subtitle: 'Clss Notes, and guides',
                cardImage: 'assets/images/computer.jpg',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(
                    assetPath: 'assets/pdf/fcc/c basic6.pdf',
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