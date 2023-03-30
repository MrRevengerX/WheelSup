import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;



class MyExercisePage extends StatefulWidget {
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
        body: SingleChildScrollView(
     child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                        );
                        if (result != null) {
                          final path = result.files.single.path!;
                          setState(() {
                            file = File(path);
                          });
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

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ButtonBar(alignment: MainAxisAlignment.start, children: [
            //       SizedBox(
            //         width: 280.0,
            //         height: 60.0,
            //         child: ElevatedButton(
            //           onPressed: () async {
            //             var uri =
            //             Uri.parse('http://localhost:5000/shoulder_press');
            //             var request = http.MultipartRequest('POST', uri);
            //             request.files.add(await http.MultipartFile.fromPath(
            //                 'file', file!.path));
            //             var response = await request.send();
            //             if (response.statusCode == 200) {
            //               print('Uploaded ...');
            //             } else {
            //               print('Something went wrong!');
            //             }
            //           },
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor:
            //             const Color.fromRGBO(219, 248, 255, 1.0),
            //             foregroundColor: Colors.black,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(30),
            //             ),
            //           ),
            //           child: const Text(
            //             "UPLOAD VIDEO",
            //             style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontFamily: "Poppins",
            //               fontSize: 16,
            //             ),
            //             textAlign: TextAlign.left,
            //           ),
            //         ),
            //       ),
            //     ]),
            //   ],
            // )
          ],
        ),
      ),
        ),

      // floatingActionButton: Container(
      //
      //   decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       border: Border.all(
      //         color: Colors.white,
      //         width: 8.0,
      //       )),
      //   height: 90.0,
      //   width: 90.0,
      //   margin: const EdgeInsets.only(
      //     bottom: 10.0,
      //     right: 30.0,
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () async {
      //       final result = await FilePicker.platform.pickFiles(
      //         type: FileType.any,
      //       );
      //       if (result != null) {
      //         final path = result.files.single.path!;
      //         setState(() {
      //           file = File(path);
      //         });
      //       }
      //     },
      //     backgroundColor: const Color(0xFF0085D0),
      //     child: const Text("Upload",
      //       style: TextStyle(
      //         fontWeight: FontWeight.w700,
      //         fontFamily: "Poppins",
      //         fontSize: 12,
      //         color: Colors.white,
      //       ),),
      //     // child: const Icon(
      //     //   Icons.navigate_next,
      //     //   size: 70,
      //     //   color: Colors.white,
      //     // ),
      //   ),
      // ),


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