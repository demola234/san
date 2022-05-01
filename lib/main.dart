import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:santander/core/controller/nav_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: MaterialApp(
      title: 'Santander',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: const NavController(),
    ));
  }
}
