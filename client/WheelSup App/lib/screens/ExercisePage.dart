import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyExercisePage extends StatefulWidget {
  const MyExercisePage({super.key});

  State<MyExercisePage> createState() => _MyExercisePageState();
}

class _MyExercisePageState extends State<MyExercisePage> {
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
      body: Container(
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
            const SizedBox(height: 0),
            const Text(
              'Dumbbell Shoulder Press',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "images/dbShoulderPress.png",
                height: 300,
                width: 300,
              ),
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
            const Text(
              '1. Sit in your wheelchair with your back straight and feet flat on the ground.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '2. Hold a dumbbell in each hand at shoulder height with palms facing forward',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '3. Inhale & press the dumbbells up overhead until your arms are fully extended but not locked out.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '4. Exhale and slowly lower the dumbbells back down to the starting position, stopping just short of your shoulders.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              '5. Repeat for the desired number of repetitions, Keeping your elbows slightly in front of your body throughout the movement. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "images/video-camera.png",
                height: 70,
                width: 70,
              ),
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
            icon: Icon(Icons.menu),
            label: 'SummaXXry',
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
