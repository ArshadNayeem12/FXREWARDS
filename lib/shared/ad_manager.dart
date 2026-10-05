import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdManager {
  static void showAdAndReward(String taskName, int reward, VoidCallback onSuccess) {
    Get.dialog(
      AlertDialog(
        title: const Text("Watching Ad..."),
        content: const LinearProgressIndicator(),
      ),
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Ad close
      onSuccess();
      Get.snackbar(
        "Reward Added!", 
        "You got $reward coins for completing $taskName.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }
}
