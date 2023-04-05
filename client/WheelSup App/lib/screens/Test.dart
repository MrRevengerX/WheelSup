import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late Future<void> _initControllerFuture;
  late CameraController _controller;
  late XFile _videoFile;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      CameraDescription(
        name: '',
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0,
        resolutionPreset: ResolutionPreset.high,
      ),
      ResolutionPreset.high,
    );
    _initControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final filePath = '${DateTime.now().millisecondsSinceEpoch}.mp4';

    try {
      await _controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      print(e);
      return;
    }

    setState(() {
      _videoFile = XFile(filePath);
    });
  }

  Future<void> _stopRecording() async {
    if (!_controller.value.isRecordingVideo) {
      return;
    }

    try {
      await _controller.stopVideoRecording();
    } on CameraException catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Stack(
                children: [
                  CameraPreview(_controller),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: _startRecording,
                            icon: Icon(Icons.videocam),
                          ),
                          IconButton(
                            onPressed: _stopRecording,
                            icon: Icon(Icons.stop),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
