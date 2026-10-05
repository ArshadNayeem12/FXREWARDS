import 'package:flutter/material.dart';
import '../../shared/ad_manager.dart';

class SpinScreen extends StatelessWidget {
  const SpinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spin & Win")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.data_usage, size: 150, color: Colors.orange),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              onPressed: () {
                AdManager.showAdAndReward("Spin", 10, () {});
              },
              child: const Text("SPIN NOW", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),
            const Text("1 Ad per Spin. Daily Limit: 100", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
