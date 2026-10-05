import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class OfferwallsScreen extends StatelessWidget {
  const OfferwallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offerwalls & Tasks")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOfferTile("Pubscale", "High paying surveys and tasks", Colors.blue, context),
          _buildOfferTile("Timewall", "Watch videos, click ads", Colors.orange, context),
        ],
      ),
    );
  }

  Widget _buildOfferTile(String name, String desc, Color color, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: color, size: 40),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Get.to(() => OfferwallWebView(title: name, url: "https://example.com/offerwall?user_id=123"));
        },
      ),
    );
  }
}

class OfferwallWebView extends StatelessWidget {
  final String title;
  final String url;
  const OfferwallWebView({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text("WebView Loads Offerwall Here")),
    );
  }
}
