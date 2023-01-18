import 'package:flutter/material.dart';
import 'package:ui_home/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.cyan
    ),
    home: const HomePage(),
  ));
}
