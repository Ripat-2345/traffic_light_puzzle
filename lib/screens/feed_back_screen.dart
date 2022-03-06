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
                      textAlign: TextAlign.center,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: (MediaQuery.of(context).size.width < 800)
                                  ? 65
                                  : 100,
                              height: (MediaQuery.of(context).size.width < 800)
                                  ? 28
                                  : 40,
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () => Get.back(),
                                  style: TextButton.styleFrom(
                                    backgroundColor: blueColor,
                                  ),
                                  child: Text(
                                    "Back",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 10
                                              : 16,
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                              width: (MediaQuery.of(context).size.width < 800)
                                  ? 65
                                  : 100,
                              height: (MediaQuery.of(context).size.width < 800)
                                  ? 28
                                  : 40,
                              child: Container(
                                child: ElevatedButton(
                                  onPressed: () => controller.sendFeedBack(
                                    controller.nameC.text,
                                    controller.emailC.text,
                                    controller.descC.text,
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: yellowColor,
                                  ),
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                      color: darkColor,
                                      fontSize:
                                          (MediaQuery.of(context).size.width <
                                                  800)
                                              ? 10
                                              : 16,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )
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
