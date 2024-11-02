import 'package:flutter/material.dart';
import 'package:notify/components/custom_texfield.dart';

import '../components/custom_victor_image.dart';
import '../components/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: const Color(0xFFF6F6F6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/a3fd26bf-1396-47af-8ca2-dd46631815c8.jpg'),
                const SizedBox(height: 70),
                const CustomTexfield(
                  txt: 'Create free notes & collaborate \nwith your team',
                  fontSize: 20,
                  mxLines: 2,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 20),
                const CustomTexfield(
                  txt:
                      'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Aenean est elit, lobortis a mattis\n vel, aliquet ut ligula.',
                  fontSize: 14,
                  mxLines: 3,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 35),
                const CustomButton(),
              ],
            ),
          ),
          const CustomVictorImage(),
        ],
      ),
    );
  }
}
