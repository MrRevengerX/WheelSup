import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? controller;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      controller = CameraController(cameras[0], ResolutionPreset.high);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onRecordButtonPressed() {
    if (_isRecording) {
      stopRecording();
      dispose();
      Navigator.of(context).pop();
    } else {
      startRecording();
    }
  }

  void _disposeAndGoBack() {
    dispose();
    Navigator.of(context).pop();
  }

  void startRecording() async {
    try {
      await controller?.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
    } on CameraException catch (e) {
      print(e);
    }
  }

  void stopRecording() async {
    try {
      await controller?.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });
    } on CameraException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller?.value == null) {
      return Scaffold(
        backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(),
          ),
      );
    }
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CameraPreview(controller!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onRecordButtonPressed,
        child:
            _isRecording ? const Icon(Icons.stop) : const Icon(Icons.videocam),
      ),
    );
  }
}
