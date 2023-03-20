import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:getwidget/getwidget.dart';

import 'CameraPage.dart';
import 'HomePage.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  List<double> percentages = [0.6, 0.4, 0.8, 0.2];
  Set<Widget> progressBars = {};
  int correctReps = 2;

  int _selectedIndex = 2;
  static const List<Widget> _widgetOptions = <Widget>[    MyCameraPage(),    MyHomePage(),    SummaryPage(),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCameraPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SummaryPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        // color: Colors.blue[50],

        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160),
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
                    "assets/images/wheelChair.png",
                    height: 95,
                    width: 70,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                'Workout Summary',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 30),
              const Text(
                'Dumbbell Shoulder Press',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 30),

              const Text(
                'Correction Levels of the Workout',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              Column(
                children: [
                  for (int i = 0; i < percentages.length; i++) ...[
                    const SizedBox(height: 30),
                    Text(
                      'Rep - ${i+1}',
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "Poppins"
                      ),
                    ),
                    GFProgressBar(
                      percentage: percentages[i],
                      width: 200,
                      radius: 100,
                      lineHeight: 50,
                      alignment: MainAxisAlignment.center,
                      backgroundColor: Colors.black38,
                      progressBarColor: Colors.green,
                    ),

                    Text(
                      'Correct Percentage - ${percentages[i]}',
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "Poppins"
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'FEEDBACK OF YOUR EXERCISE',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 10),

              Text(
                'Total Completed Reps - ${percentages.length}',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 10),

              Text(
                'Total Correct Reps - $correctReps',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background color
                  onPrimary: Colors.white, // text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8), // button padding
                ),


                child: const Text('Watch Video'),
              )
            ],
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
            icon: Icon(Icons.menu),
            label: 'Summary',
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
