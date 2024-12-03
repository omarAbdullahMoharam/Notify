import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const Notify());
}

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFF8383),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
