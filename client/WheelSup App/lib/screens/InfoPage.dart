import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'CameraPage.dart';
import 'HomePage.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<double> percentages = [0.6, 0.4, 0.8, 0.2];
  Set<Widget> progressBars = {};
  int correctReps = 2;

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyCameraPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blue[50],
        color: Colors.white,
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



            const SizedBox(height:0),
            const Text(
              'Make Yourself Stronger.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),


            const SizedBox(height: 20),

            InkWell(
              onTap: (){},

              child: Image.asset(
                "assets/images/info1.jpg",
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "WheelSup is designed to provide personalized workout plans to individuals with physical disabilities who use a wheelchair for mobility. This application uses machine learning algorithms to analyze user data, including the user's physical abilities and limitations, as well as their fitness goals.",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "WheelSup also includes instructional images to demonstrate proper form and technique for each exercise, as well as tips on how to modify exercises to accommodate individual needs and limitations.",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "Overall, WheelSup provides a personalized and adaptable fitness plan to improve physical health and fitness, enhance mobility, and boost overall quality of life for individuals with physical disabilities.",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              'Get Ready For Your Day 01',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),

            ),

            const Text(
              'WheelSup Will Guide You!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),
          ],
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