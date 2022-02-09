import 'package:flutter/material.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:flutter_game/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Lemon'),
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
