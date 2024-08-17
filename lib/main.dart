import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newweatherapp/screen/leading_screen.dart';
import 'package:newweatherapp/screen/leading_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      title: 'weather_app',
      home: LeadingPPage(),
    );
  }
}
