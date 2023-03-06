import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:device_preview/device_preview.dart';
import 'package:janudha/screens/HomePage.dart';
import 'package:janudha/screens/navbar.dart';

import 'screens/HomePage.dart';

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
        title: "Flutter Demo",
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        // home: MyHomePage(),
        home: const MyHomePage(),


    );
  }
}

