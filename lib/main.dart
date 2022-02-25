import 'package:flutter/material.dart';
import 'package:flutter_game/screens/feed_back_screen.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBcXakFFDhCHffDoP_OQWeqaZYyHhHIA14",
      appId: "1:353073169291:web:244fd5c7ed41000a06658e",
      messagingSenderId: "353073169291",
      projectId: "traffic-light-puzzle",
    ),
  );
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
