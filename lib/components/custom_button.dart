import 'package:flutter/material.dart';

import '../helpers/constatns.dart';
import '../screens/home_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(145, 38),
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            Icons.trending_flat,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
