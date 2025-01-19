import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Notes Home Page',
          style: TextStyle(
            color: Colors.indigo,
            fontFamily: 'Poppins',
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
