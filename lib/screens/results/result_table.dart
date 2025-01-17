
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_saver/file_saver.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:braucoe/data/apis/result_api.dart';
import '../../providers/student_data_provider.dart';

class ResultTable extends StatefulWidget {

  final String year;
  const ResultTable({required this.year, super.key});

  @override
  State<ResultTable> createState() => _ResultTable();
}

class _ResultTable extends State<ResultTable> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_sharp),
                    onPressed: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Screenshot(
                controller: screenshotController,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.year} Results",
                            style: const TextStyle(fontFamily: "LibreFranklin-SemiBold", fontSize: 28),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.95,
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(width: 2,color: Colors.black), left : BorderSide(width : 1.5, color: Colors.black), right: BorderSide(width : 1.5, color: Colors.black), bottom: BorderSide(width : 1.5, color: Colors.black)),
                          color: Color(0x4DCF9F69),
                        ),
                        child: const Center(child: Text("Aggregate Details", style: TextStyle(decoration: TextDecoration.underline,fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 17),)),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.025, 0, screenWidth * 0.025, 0),
                        child: Table(
                          border: const TableBorder(left: BorderSide(width: 1.5, color: Colors.black),
                              right: BorderSide(width: 1.5, color: Colors.black),
                              verticalInside: BorderSide(width: 1.5, color: Colors.black)),
                          columnWidths: const {0 : FlexColumnWidth(60),
                            1 : FlexColumnWidth(150),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                                children: [
                                  const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Text("Roll Number", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                      )
                                  ),
                                  TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Text("${Provider.of<StudentData>(context, listen: false).studentDetails?.studentId}", style: const TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15),),
                                      )
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: Text("Name", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: AutoSizeText(capitalize("${Provider.of<StudentData>(context, listen: false).studentDetails?.student_name}"),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: "LibreFranklin-Regular",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          )),
                                    ),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: Text("Branch", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                    ),
                                  ),
                                  TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: AutoSizeText("${Provider.of<StudentData>(context, listen: false).studentDetails?.branch}",
                                            overflow: TextOverflow.ellipsis
                                            ,style: const TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                      )
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: Text("SGPA", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                    ),
                                  ),
                                  TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Text("${ResultAPI.SGPA}", style: const TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                      )
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.95,
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(width: 2,color: Colors.black), left : BorderSide(width : 1.5, color: Colors.black), right: BorderSide(width : 1.5, color: Colors.black), bottom: BorderSide(width : 1.5, color: Colors.black)),
                          color: Color(0x4DCF9F69),
                        ),
                        child: const Center(child: Text("Mark Details", style: TextStyle(decoration: TextDecoration.underline,fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 17),)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.025, 0, screenWidth * 0.025, 0),
                        child: Table(
                          border: const TableBorder(left: BorderSide(width: 1.5, color: Colors.black),
                              right: BorderSide(width: 1.5, color: Colors.black),
                              bottom: BorderSide(width: 1.5, color: Colors.black),
                              verticalInside: BorderSide(width: 1.5, color: Colors.black)),
                          columnWidths: const {0 : FlexColumnWidth(300),
                            1 : FlexColumnWidth(100),
                            2 : FlexColumnWidth(100)
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            const TableRow(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 2)),
                              ),
                              children: [
                                TableCell(
                                  verticalAlignment : TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text("Subject Name", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment : TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text("Grade", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text("GPA", style: TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w600, fontSize: 15)),
                                  ),
                                ),
                              ],
                            ),
                            ...List.generate(ResultAPI.result.length, (index) => TableRow(
                              children: [
                                TableCell(
                                  verticalAlignment : TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text("${ResultAPI.result[index].getPapName}", style: const TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                    // child: Text("$index"),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment : TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    // child: Text("$index"),
                                    child: Text("${ResultAPI.result[index].getPapGR}", style: const TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    // child: Text("$index"),
                                    child: Text("${ResultAPI.result[index].getPapGRP}", style: const TextStyle(fontFamily: "LibreFranklin-Regular", fontWeight: FontWeight.w400, fontSize: 15)),
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () async{
          var image =  await screenshotController.capture();
          savePDF(image!);
        },
        child : Container(
          height: 65,
          width: 67,
          decoration: BoxDecoration(
            color: const Color(0xFF00512D),
            borderRadius: BorderRadius.circular(90),
          ),
          child: const Icon(Icons.file_download_outlined, color: Color(0xFFFCFCFC), size: 37,),
        ),
      ),
    );
  }

  // String Format
  String capitalize(String s)
  {
    if(s.isEmpty)
      {
        return "";
      }
    List<String> words = s.split(" ");
    String updatedName = "";
    for(int i = 0; i < words.length; i++)
      {
        updatedName += "${words[i][0].toUpperCase()}${words[i].substring(1).toLowerCase()} ";
      }
    return updatedName;
  }

  // Save PDF.
void savePDF(Uint8List image) async
{
  pw.Document pdf = pw.Document();
  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
      build: (context) {
    return pw.Expanded(
      child:  pw.Image(pw.MemoryImage(image)),
    );
  }
  )
  );
  var savedPDF = await pdf.save();

  String? filePath = await FileSaver.instance.saveAs(name: widget.year,bytes: savedPDF, ext: 'pdf', mimeType: MimeType.pdf);
}
}
