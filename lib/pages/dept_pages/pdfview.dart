import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PDFViewerPage extends StatelessWidget {
  final String assetPath;
  final String downloadUrl;
  final String fileName;

  const PDFViewerPage({
    super.key,
    required this.assetPath,
    required this.downloadUrl,
    required this.fileName,
  });

  Future<void> _confirmAndDownload(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Download PDF"),
          content: const Text("Do you want to download this PDF file?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      _downloadPDF(context);
    }
  }

  Future<void> _downloadPDF(BuildContext context) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      Directory? directory;

      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      final filePath = "${directory!.path}/$fileName";

      try {
        await Dio().download(downloadUrl, filePath);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Downloaded to $filePath")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Download failed: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Storage permission denied")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _confirmAndDownload(context),
          ),
        ],
      ),
      body: SfPdfViewer.asset(assetPath),
    );
  }
}
