import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:summary_page/screens/SummaryPage.dart';

class MyExercisePage extends StatefulWidget {
  const MyExercisePage({super.key});

  @override
  State<MyExercisePage> createState() => _MyExercisePage();
}

class _MyExercisePage extends State<MyExercisePage> {
  File? file;
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 80, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Camera',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Summary',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.20), // s
          child:SingleChildScrollView(
          child: Container(
          child: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Text(
                "WHEEL",
                style: TextStyle(
                    fontSize: 45,
                    color: HexColor('#0D6B9F'),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ConcertOne"),
              ),
              Text(
                "SUP",
                style: TextStyle(
                    fontSize: 45,
                    color: HexColor('#28AEFA'),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ConcertOne"),
              ),
              Image.asset(
                "images/wheelChair.png",
                height: 50,
                width: 50,
              ),
            ],
            ),

              const SizedBox(height: 30),
              const Text(
                'Dumbbell Shoulder Press',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 30),
              const Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Sit in your wheelchair with your back straight and feet flat on the ground.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '2. Hold a dumbbell in each hand at shoulder height with palms facing forward',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '3. Inhale & press the dumbbells up overhead until your arms are fully extended but not locked out.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '4. Exhale and slowly lower the dumbbells back down to the starting position, stopping just short of your shoulders.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '5. Repeat for the desired number of repetitions, Keeping your elbows slightly in front of your body throughout the movement. ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
  //
  //
              const SizedBox(height: 0),
              Image.asset(
                "images/dbShoulderPress.png",
                height: 300,
                width: 300,
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(alignment: MainAxisAlignment.start, children: [
                    SizedBox(
                      width: 280.0,
                      height: 60.0,
                  // FlatButton(
                  //   onPressed: () async {
                  //     final result = await FilePicker.platform.pickFiles(type: FileType.video);
                  //     if (result != null) {
                  //       // Code to upload the file to the server...
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text("File Uploaded"),
                  //             content: Text("Your video has been successfully uploaded."),
                  //             actions: [
                  //               TextButton(
                  //                 child: Text("OK"),
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(builder: (context) => SummaryPage()),
                  //                   );
                  //                 },
                  //               ),
                  //             ],
                  //           );
                  //         },
                  //       );
                  //     }
                  //   },
                  //   child: Text("UPLOAD VIDEO"),
                  // );



                  child: ElevatedButton(
                        onPressed: () async {

                          final result = await FilePicker.platform.pickFiles(type: FileType.video);
                          if (result != null) {

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text("Video Proccessing"),
                                      content: Text("Your video is processing. Please wait"),
                                      // actions: [
                                      //   TextButton(
                                      //     onPressed: () { Navigator.of(context).pop(); },
                                      //     child: Text("OK"),
                                      //   )
                                      // ]
                                  );
                                }
                              );

                            final fileBytes = result.files.single.bytes;
                            final fileName = result.files.single.name;

                            final uri = Uri.parse('http://localhost:5000/shoulder_press');
                            final request = http.MultipartRequest('POST', uri)
                              ..files.add(http.MultipartFile.fromBytes('video', fileBytes!,
                                  filename: fileName));
                            final response = await request.send();

                            if (response.statusCode == 200) {
                              print('Uploaded');

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SummaryPage()),
                              );
                            } else {
                              print('Something went wrong!');
                            }
                          }
                          else{
                            // Store a reference to the BuildContext object
                            final contextRef = context;

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text("Error"),
                                      content: Text("The video selected cannot be proccessed"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Use the stored reference to the BuildContext object
                                            Navigator.of(contextRef).pop();
                                          },
                                          child: Text("OK"),
                                        )
                                      ]
                                  );
                                }
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromRGBO(219, 248, 255, 1.0),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "UPLOAD VIDEO",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
        ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}