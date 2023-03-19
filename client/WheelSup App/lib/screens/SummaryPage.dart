import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:getwidget/getwidget.dart';

class SummaryPage extends StatefulWidget {

  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
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
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.blue[50],
          color: Colors.blue[50],
          width: double.infinity,
          height: double.infinity,
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



              const SizedBox(height:30),
              const Text(
                'Workout Summary',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height:30),
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
                'Average Correction Level of the Workout',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),


              const SizedBox(height: 50),

              // Progress Bar 1
              GFProgressBar(
                percentage: 0.6,
                width:200,
                radius: 100,
                lineHeight: 50,
                alignment: MainAxisAlignment.center,
                backgroundColor : Colors.black38,
                progressBarColor: Colors.green,
              ),

              const Text(
                'Correct Posture Percentage of the Workout - ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 50),

              const SizedBox(height: 30),

              const Text(
                'FEEDBACK OF YOUR EXERCISE',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const Text(
                'Total Completed Reps - ',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Poppins"),
              ),

              const Text(
                'Total Correct Reps - ',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Poppins"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text('Watch Video'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background color
                  onPrimary: Colors.white, // text color
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // button padding
                ),
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