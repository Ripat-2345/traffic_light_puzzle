import 'package:flutter/material.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1D00A),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Traffic Light Puzzle",
            style: TextStyle(
              color: Color(0XFF3E497A),
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Align(
            child: Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width < 800) ? 200 : 300,
                height: (MediaQuery.of(context).size.width < 800) ? 120 : 180,
                child: Lottie.asset(
                  "images/car.json",
                  fit: BoxFit.cover,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Get.to(
                  const GameScreen(),
                ),
                child: const Text(
                  "Start Game",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
