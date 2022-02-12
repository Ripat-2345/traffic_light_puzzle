import 'package:flutter/material.dart';
import 'package:flutter_game/controllers/game_controller.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final gameController = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Lemon'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
