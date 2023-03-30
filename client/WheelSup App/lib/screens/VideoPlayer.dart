import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import 'CameraPage.dart';
import 'HomePage.dart';
import 'SummaryPage.dart';


class VideoPlayerScreen extends StatefulWidget {
final String videoUrl;

const VideoPlayerScreen({required this.videoUrl});

@override
_VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
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


  late VideoPlayerController _controller;
late Future<void> _initializeVideoPlayerFuture;

@override
void initState() {
super.initState();
_controller = VideoPlayerController.asset(widget.videoUrl);
_initializeVideoPlayerFuture = _controller.initialize();
_controller.setLooping(true);
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: FutureBuilder(
future: _initializeVideoPlayerFuture,
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.done) {
return AspectRatio(
aspectRatio: _controller.value.aspectRatio,
child: VideoPlayer(_controller),
);
} else {
return Center(
child: CircularProgressIndicator(),
);
}
},
),
floatingActionButton: FloatingActionButton(
onPressed: () {
if (_controller.value.isPlaying) {
_controller.pause();
} else {
_controller.play();
}
},
child: Icon(
_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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