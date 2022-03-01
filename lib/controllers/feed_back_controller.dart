import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game/const.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FeedBackController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController descC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    descC = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameC.dispose();
    emailC.dispose();
    descC.dispose();
  }

  void sendFeedBack(String name, String email, String desc) async {
    CollectionReference feedbacks = firestore.collection("feedbacks");
    try {
      await feedbacks.add({
        "name": name,
        "email": email,
        "desc": desc,
      });

      Get.defaultDialog(
        barrierDismissible: false,
        backgroundColor: whiteColor,
        title: "Thank You",
        titleStyle: TextStyle(color: darkColor, fontSize: 26),
        content: Lottie.asset(
          "assets/images/success.json",
          width: 300,
          fit: BoxFit.cover,
        ),
        contentPadding: const EdgeInsets.all(10),
        textConfirm: "Back To Home",
        confirmTextColor: darkColor,
        onConfirm: () {
          nameC.clear();
          emailC.clear();
          descC.clear();
          Get.offAllNamed("/Home");
        },
        buttonColor: yellowColor,
      );
    } catch (e) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: "System Error",
        titleStyle: TextStyle(color: darkColor, fontSize: 26),
        middleText: "You Cannot Send Feedback",
        middleTextStyle: TextStyle(color: darkColor, fontSize: 18),
        textConfirm: "Ok",
        confirmTextColor: darkColor,
        onConfirm: () => Get.back(),
        buttonColor: yellowColor,
      );
    }
  }
}
