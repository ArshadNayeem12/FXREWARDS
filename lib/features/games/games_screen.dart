import 'package:flutter/material.dart';
import '../../shared/ad_manager.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Play Games & Earn")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.videogame_asset, color: Colors.purple, size: 40),
            title: Text("Mini Game ${index + 1}"),
            subtitle: const Text("Play for 1 min to earn ₹5"),
            trailing: ElevatedButton(
              onPressed: () {
                AdManager.showAdAndReward("Game ${index + 1}", 5, () {});
              },
              child: const Text("Play"),
            ),
          );
        },
      ),
    );
  }
}
