// help_center_screen.dart
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  static String routeName = "/help_center";

  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "How can we help you?",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text("Frequently Asked Questions"),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: const Text("Customer Support"),
              onTap: () {
                // Navigate to Customer Support page
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About Us"),
              onTap: () {
                // Navigate to About Us page
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text("Contact Us"),
              onTap: () {
                // Navigate to Contact Us page
              },
            ),
            // Add more ListTile widgets as needed for different help topics
          ],
        ),
      ),
    );
  }
}
