import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/SummaryPage.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: MaterialApp(
    //     locale: DevicePreview.locale(context),
    //     builder: DevicePreview.appBuilder,
    //     title: "Flutter Demo",
    //     theme: ThemeData(
    //       brightness: Brightness.dark,
    //     ),
    //     home: MyHomePage(),
    //   ),
    // );

    return  MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "WheelSup",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      // home: MyHomePage(),
      home: const SummaryPage(),


    );
  }
}

