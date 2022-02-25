import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.toNamed("/Home");
        return Future(() => true);
      },
      child: Scaffold(),
    );
  }
}
