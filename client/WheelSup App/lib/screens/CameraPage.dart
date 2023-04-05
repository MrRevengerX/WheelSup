import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:summary_page/screens/Camera.dart';
import 'HomePage.dart';
import 'InfoPage.dart';
import 'SummaryPage.dart';

class MyCameraPage extends StatefulWidget {
  const MyCameraPage({super.key});

  @override
  State<MyCameraPage> createState() => _MyCameraPageState();
}

class _MyCameraPageState extends State<MyCameraPage> {
  int _selectedIndex = 0;

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
        color: Colors.blue[50],
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130),
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
            const SizedBox(height: 10,),
            const Text(
              'Camera Placement Instructions \n',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const Text(
              ' 1. Camera should be positioned within 2.5-3 m which allows you to see your entire body. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '2. Camera should be placed at a direct angle facing the user. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const Text(
              ' 3. Background lighting should be bright enough to ensure that you are clearly visible in the \n video.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const Text(
              ' 4. Place the camera on a stable surface(tripod) to ensure that it remains steady throughout the\n recording. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const Text(
              ' 5. Avoid using the zoom function on the camera, As this can cause distortion and make it difficult \n for you to see your movements clearly. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(alignment: MainAxisAlignment.start, children: [
                  Container(
                    width: 280.0,
                    height: 55.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Camera()
                          )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(40, 174, 250, 1.0),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "START RECORDING",
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