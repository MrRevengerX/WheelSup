import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'HomePage.dart';

class MyWelcomePage extends StatefulWidget {
  @override
  _MyWelcomePageState createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {
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
              Image.asset(
                "assets/images/chair.png",
                height: 400,
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome To',
                style: TextStyle(
                    fontSize: 16, color: Colors.black, fontFamily: "Poppins"),
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
                'Plan and start your daily workout &',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'grow your fitness.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 280.0,
                          height: 55.0,
                          child: ElevatedButton(
                            onPressed:() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(219, 248, 255, 1.0),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "GET STARTED",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ]
                  ),
                ],
              )
            ],
          ),
        ),
        // floatingActionButton: Container(
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     border: Border.all(
        //       color: Colors.white,
        //       width: 8.0,
        //     )
        //   ),
        //
        //   height: 90.0,
        //   width: 90.0,
        //   margin: const EdgeInsets.only(
        //     bottom: 50.0,
        //     right: 20.0,
        //   ),
        //   child: FloatingActionButton(
        //     onPressed: () {},
        //     backgroundColor: HexColor('#0085D0'),
        //     child: const Icon(
        //       Icons.navigate_next,
        //       size: 70,
        //       color: Colors.white,
        //     ),
        //   ),
        );
  }
}
