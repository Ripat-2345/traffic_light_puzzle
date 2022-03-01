import 'package:flutter/material.dart';
import 'package:flutter_game/const.dart';
import 'package:flutter_game/controllers/feed_back_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({Key? key}) : super(key: key);
  final controller = Get.put(FeedBackController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.toNamed("/Home");
        return Future(() => true);
      },
      child: Scaffold(
        backgroundColor: yellowColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: darkColor,
                  ),
                  child: Center(
                    child: Text(
                      "Give Your Feedback",
                      style: TextStyle(
                        color: yellowColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width / 2,
                  height: 500,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: darkColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                          controller: controller.nameC,
                          style: TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: whiteColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                            fillColor: blueColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: whiteColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: yellowColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                          controller: controller.emailC,
                          style: TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: whiteColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                            fillColor: blueColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: whiteColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: yellowColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: TextField(
                          controller: controller.descC,
                          maxLines: 10,
                          style: TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            hintText: "Your FeedBack",
                            hintStyle: TextStyle(
                              color: whiteColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                            fillColor: blueColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: yellowColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            if ((controller.nameC.text != "") &&
                                (controller.emailC.text != "") &&
                                (GetUtils.isEmail(controller.emailC.text)) &&
                                (controller.descC.text != "")) {
                              controller.sendFeedBack(
                                controller.nameC.text,
                                controller.emailC.text,
                                controller.descC.text,
                              );
                            } else {
                              Get.defaultDialog(
                                barrierDismissible: false,
                                title: "System Error",
                                titleStyle:
                                    TextStyle(color: darkColor, fontSize: 26),
                                middleText:
                                    "Sorry all fields cannot be empty and the email field must be email",
                                middleTextStyle:
                                    TextStyle(color: darkColor, fontSize: 18),
                                textConfirm: "Ok",
                                confirmTextColor: darkColor,
                                onConfirm: () => Get.back(),
                                buttonColor: yellowColor,
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: yellowColor,
                          ),
                          child: Text(
                            "Send",
                            style: TextStyle(
                              color: darkColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
