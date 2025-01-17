
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

import 'package:braucoe/widgets/pdf_view.dart';
import 'package:braucoe/widgets/subject_check_box.dart';
import 'package:braucoe/services/firebase_storage_services.dart';
import 'package:braucoe/utilities/file_handling.dart';
import 'package:braucoe/utilities/semester.dart';

class SubjectSelectionScreen extends StatefulWidget {
  SubjectSelectionScreen({
    required this.titleText,
    required this.selectedYear,
    required this.firebaseStoragePath,
    super.key,
  });

  String titleText;
  String selectedYear;
  String firebaseStoragePath;

  @override
  State<SubjectSelectionScreen> createState() => _SubjectSelectionScreenState();
}

class _SubjectSelectionScreenState extends State<SubjectSelectionScreen> {
  final SemesterSyllabus semesterSyllabus = SemesterSyllabus();

  bool isValid = true;

  void _showSnackBar() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('File(s) downloaded'),
        action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
            }),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  void _downloadFiles() async {
    var updatedList =
        semesterSyllabus.semesters[widget.selectedYear]?.where((subject) {
      return subject['isChecked'] as bool == true;
    }).toList();
    if (updatedList!.isEmpty) {
      setState(() {
        isValid = false;
      });
      return;
    }
    for (var subject in updatedList) {
      String tempPath =
          '${widget.firebaseStoragePath}/${subject['subject']}.pdf';
      final filePath = (await getApplicationDocumentsDirectory()).path;
      File localFile =
          File('$filePath/${subject['subject'].toString()}_syllabus.pdf');
      await FirebaseStorageServices(firebaseStoragePath: tempPath)
          .getFirebaseSyllabusRef
          .writeToFile(localFile);
      await FileHandling.saveFile(localFile, subject['subject'].toString());
    }
    _showSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(
                'Tap the subject below to view and Select the subjects below to download ${widget.titleText.replaceAll('_', ' ')}',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
                // maxLines: 2,
              ),
            ),
            Container(
              height: height * 0.58,
              margin: const EdgeInsets.only(left: 30),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: semesterSyllabus.semesters[widget.selectedYear]!
                      .map(
                        (subject) => Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                String tempPath =
                                    '${widget.firebaseStoragePath}/${subject['subject']}.pdf';
                                final filePath =
                                    (await getApplicationDocumentsDirectory())
                                        .path;
                                File localFile = File(
                                    '$filePath/${subject['subject'].toString()}_syllabus.pdf');
                                await FirebaseStorageServices(
                                        firebaseStoragePath: tempPath)
                                    .getFirebaseSyllabusRef
                                    .writeToFile(localFile);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => PdfView(
                                      subjectName: subject['subject'].toString(),
                                      file: localFile,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                subject['subject'].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: SubjectCheckBox(
                                subject: subject,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            if (!isValid)
              const Center(
                child: Text(
                  "Please select subject!",
                  style: TextStyle(
                    color: Color(0xFFCF0000),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'download',
        backgroundColor: const Color(0xFF00512D),
        elevation: 8,
        onPressed: _downloadFiles,
        child: const Icon(
          Icons.file_download_outlined,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
