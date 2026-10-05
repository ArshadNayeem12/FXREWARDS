import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../spin/spin_screen.dart';
import '../scratch/scratch_screen.dart';
import '../captcha/captcha_screen.dart';
import '../offerwalls/offerwalls_screen.dart';
import '../games/games_screen.dart';
import '../wallet/redeem_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ultimate Rewards"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () => Get.to(() => const RedeemScreen()),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildCard("Spin & Win", Icons.data_usage, Colors.orange, () => Get.to(() => const SpinScreen())),
          _buildCard("Scratch Card", Icons.aspect_ratio, Colors.blue, () => Get.to(() => const ScratchScreen())),
          _buildCard("Captcha Verify", Icons.security, Colors.green, () => Get.to(() => const CaptchaScreen())),
          _buildCard("Play Games", Icons.sports_esports, Colors.purple, () => Get.to(() => const GamesScreen())),
          _buildCard("Offerwalls", Icons.local_offer, Colors.red, () => Get.to(() => const OfferwallsScreen())),
          _buildCard("Instant Redeem", Icons.card_giftcard, Colors.teal, () => Get.to(() => const RedeemScreen())),
        ],
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
