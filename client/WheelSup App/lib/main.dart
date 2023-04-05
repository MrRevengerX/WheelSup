import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'screens/WelcomePage.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        title: "WheelsSup",
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
        home: MyWelcomePage(),
    );
  }
}

