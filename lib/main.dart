import 'package:flutter/material.dart';
import 'package:flutter_game/screens/feed_back_screen.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';

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
      initialRoute: '/Home',
      getPages: [
        GetPage(name: '/Home', page: () => const HomeScreen()),
        GetPage(name: '/Game', page: () => const GameScreen()),
        GetPage(name: '/FeedBack', page: () => const FeedBackScreen()),
      ],
      home: const HomeScreen(),
    );
  }
}
