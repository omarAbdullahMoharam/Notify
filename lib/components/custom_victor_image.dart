import 'package:flutter/material.dart';

class CustomVictorImage extends StatelessWidget {
  const CustomVictorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180,
      right: 152,
      left: 89,
      child: Image.asset(
        'assets/images/8b2ab94ac0968fa20e185a3eced948a8.png',
        width: 200,
        height: 375,
      ),
    );
  }
}
