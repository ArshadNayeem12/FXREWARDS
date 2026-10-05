import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});
  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  int walletBalance = 5000;
  String? generatedCode;

  void redeemPlayCode() {
    if (walletBalance >= 1000) {
      setState(() {
        walletBalance -= 1000;
        generatedCode = "XXXX-YYYY-ZZZZ-1234";
      });
      Get.snackbar("Success", "Redeemed ₹50 Google Play Code!", backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar("Error", "Insufficient Balance", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Instant Redeem")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Text("Total Coins", style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text(walletBalance.toString(), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.play_arrow, color: Colors.green, size: 40),
              title: const Text("Google Play Code (₹50)"),
              subtitle: const Text("Cost: 1000 Coins"),
              trailing: ElevatedButton(
                onPressed: redeemPlayCode,
                child: const Text("Redeem"),
              ),
            ),
            if (generatedCode != null) ...[
              const SizedBox(height: 40),
              const Text("Your Gift Card Code:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: SelectableText(generatedCode!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
