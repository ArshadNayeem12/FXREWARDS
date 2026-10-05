import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/ad_manager.dart';

class CaptchaScreen extends StatefulWidget {
  const CaptchaScreen({super.key});
  @override
  State<CaptchaScreen> createState() => _CaptchaScreenState();
}

class _CaptchaScreenState extends State<CaptchaScreen> {
  final TextEditingController _controller = TextEditingController();
  final String _captchaText = "X9G2K";

  void verifyCaptcha() {
    if (_controller.text == _captchaText) {
      AdManager.showAdAndReward("Captcha", 5, () {
        _controller.clear();
      });
    } else {
      Get.snackbar("Error", "Invalid Captcha");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Solve Captcha")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(color: Colors.grey[300]),
  child: Text(_captchaText, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough, letterSpacing: 5.0)),
),

            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Enter Captcha Here"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyCaptcha,
              child: const Text("Verify & Earn"),
            )
          ],
        ),
      ),
    );
  }
}
