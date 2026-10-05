import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import '../../shared/ad_manager.dart';

class ScratchScreen extends StatelessWidget {
  const ScratchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scratch Card")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Scratcher(
              brushSize: 50,
              threshold: 50,
              color: Colors.blueGrey,
              onThreshold: () {
                AdManager.showAdAndReward("Scratch", 15, () {});
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.white,
                alignment: Alignment.center,
                child: const Text("You Won ₹15!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Scratch to win coins. Ad will show after scratching.", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
