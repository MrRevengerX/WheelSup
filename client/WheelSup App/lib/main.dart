import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:summary_page/screens/Camera.dart';
import 'screens/WelcomePage.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
  ),
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: "WheelsSup",
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
        home: Camera(),
    );
  }
}

