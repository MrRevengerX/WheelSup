import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'dart:convert';
import 'CameraPage.dart';
import 'HomePage.dart';
import 'VideoPlayer.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Future getUserData() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:5000/'));

    Map<String, dynamic> jsonMap = json.decode(response.body);
    Exercise exercise = Exercise.fromJson(jsonMap);
    return exercise;
  }

  int _selectedIndex = 2;
  Set<Widget> progressBars = {};
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
          MaterialPageRoute(builder: (context) => const SummaryPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Card(
          child: FutureBuilder(
            future: getUserData(),
            //snapshot: checks whether the data has been returned from the api
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Exercise workoutDetails = snapshot.data!;
                int correctReps = workoutDetails.correctReps;
                int totalReps = workoutDetails.totalReps;
                String videoUrl = workoutDetails.video;
                Map<String, double> repDetails = workoutDetails.repDetails;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        'Shoulder Press',
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

                      Column(
                        children: repDetails.keys.map((i) => Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            'Rep - ${int.parse(i)+1}',
                            style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Poppins"
                            ),
                          ),

                          GFProgressBar(
                            percentage: repDetails[i]!/100,
                            width: 200,
                            radius: 100,
                            lineHeight: 50,
                            alignment: MainAxisAlignment.center,
                            backgroundColor: Colors.black38,
                            progressBarColor: Colors.green,
                          ),

                          Text(
                            'Correct Percentage - ${repDetails[i]}',
                            style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Poppins"
                            ),
                            ),
                          ],
                        )).toList(),
                      )

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
                              'Total Completed Reps - $totalReps',
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



                            // ElevatedButton(
                            //   onPressed: () async {
                            //     var url = videoUrl;
                            //     if (await canLaunchUrl(url as Uri)) {
                            //       await launchUrl(url as Uri);
                            //     } else {
                            //       throw 'Could not launch $url';
                            //     }
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     foregroundColor: Colors.white, backgroundColor: Colors.blue, // text color
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 16, vertical: 8), // button padding
                            //   ),
                            //   child: const Text('Watch Video'),
                            // ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const VideoPlayerScreen(videoUrl: 'assets/uploads/user_upload.mp4')),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.blue, // text color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8), // button padding
                              ),
                              child: const Text('Watch Video'),
                            ),

                      const SizedBox(height: 16),
                    ],
                        );

              } else if (snapshot.hasError) {
                  return Text('Error retrieving workout details: ${snapshot.error}');
              } else {
                  return const CircularProgressIndicator();
              }
            },
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

class Workout{
  final String videoUrl;
  final int incorrectReps, totalReps, correctReps;
  Map<String, double> repDetails = {};

  Workout(this.videoUrl, this.incorrectReps, this.totalReps, this.correctReps, this.repDetails);

}
class Exercise {
  int correctReps;
  int incorrectReps;
  Map<String, double> repDetails;
  int totalReps;
  String video;

  Exercise({
    required this.video,
    required this.incorrectReps,
    required this.totalReps,
    required this.correctReps,

    required this.repDetails,

  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      correctReps: json['correct_reps'],
      incorrectReps: json['incorrect_reps'],
      repDetails: Map<String, double>.from(json['rep_details']),
      totalReps: json['total_reps'],
      video: json['video'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['correct_reps'] = correctReps;
    data['incorrect_reps'] = incorrectReps;
    data['rep_details'] = repDetails;
    data['total_reps'] = totalReps;
    data['video'] = video;
    return data;
  }
}

