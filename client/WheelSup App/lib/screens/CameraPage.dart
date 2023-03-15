import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCameraPage extends StatefulWidget {
  const MyCameraPage({super.key});

  @override
  State<MyCameraPage> createState() => _MyCameraPageState();
}

class _MyCameraPageState extends State<MyCameraPage> {
  int _selectedIndex = 0;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 0),
                Text(
                  ' Camera Placement Instructions',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20),
                Text(
                  ' 1. Camera should be positioned within 2.5-3 m \n which allows you to see your entire body. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  ' 2. Camera should be placed at a direct angle \n facing the user. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  ' 3. Background lighting should be bright enough \n to ensure that you are clearly visible in the \n video.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  ' 4. Camera should be placed on a stable \n surface or tripod to ensure that it remains \n steady throughout the recording. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  ' 5. Avoid using the zoom function on the camera, \n As this can cause distortion and make it difficult \n for you to see your movements clearly. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
              ],
            )
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
