import 'package:flutter/material.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selected;
  List<String> data = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"];

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
              Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width < 800) ? 120 : 300,
                  // height: (MediaQuery.of(context).size.width < 800) ? 100 : 200,
                  child: Lottie.asset(
                    "images/car.json",
                    fit: BoxFit.cover,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton(
                    underline: DropdownButtonHideUnderline(child: Container()),
                    dropdownColor: Color(0XFFF1D00A),
                    value: selected,
                    hint: Text(
                      "Pilih level",
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selected = value.toString();
                      });
                    },
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                              )),
                        )
                        .toList(),
                  ),
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
          ),
        ));
  }
}
