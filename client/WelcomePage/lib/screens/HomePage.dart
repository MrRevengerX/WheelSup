import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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


              const SizedBox(height: 10),
              // Image.asset(
              //   "assets/images/DumbbellShoulderPress.jpg",
              //   height: 176,
              //   width: 310,
              // ),
              //
              //
              // const SizedBox(height: 30),
              // Image.asset(
              //   "assets/images/chair.png",
              //   height: 176,
              //   width: 310,
              // ),

              InkWell(
                onTap: () {}, // needed
                child: Image.asset(
                  "assets/images/chair.png",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),
              InkWell(
                onTap: () {}, // needed
                child: Image.asset(
                  "assets/images/chair.png",
                  height: 150,
                  fit: BoxFit.cover,
                  color: Colors.transparent,
                ),
              ),

              const SizedBox(height: 50),
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
                    color: Colors.black,
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

              const SizedBox(height: 50),
              const Text(
                'Navigation Bar Comes Here',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),


    );
  }
}
