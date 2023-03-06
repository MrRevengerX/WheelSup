import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              'Choose Exercise',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),


            const SizedBox(height: 20),

            InkWell(
              //Tried the Clicking effect on Image Icon--------------------
              //Didn't Work------------------------

              // onTap: () {},
              // splashColor: Colors.blueGrey.withOpacity(0.5),// needed
              // child: Ink(
              //   height: 185,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/blue.png"),
              //       fit: BoxFit.cover,
              //     )
              //   )
              // )
              onTap: () {},
              child: Image.asset(
                "assets/images/blue.png",
                height: 190,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            InkWell(
              onTap: () {}, // needed
              child: Image.asset(
                "assets/images/blue1.png",
                height: 190,
                fit: BoxFit.cover,
                color: Colors.transparent,
              ),

            ),

            const SizedBox(height: 30),
            const Text(
              'Welcome To',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),

            const Text(
              'WHEELSUP FITNESS APP',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const Text(
              'Choose any exercise you like,',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
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