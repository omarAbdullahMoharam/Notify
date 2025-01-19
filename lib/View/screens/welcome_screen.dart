import 'package:flutter/material.dart';
import 'package:notify/components/custom_texfield.dart';
import 'package:notify/helpers/constatns.dart';
import 'package:notify/components/custom_shape.dart';

import '../../components/custom_button.dart';

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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomShape(),
                SizedBox(height: 70),
                CustomTexfield(
                  txt: 'Create free notes & collaborate \nwith your team',
                  fontSize: 20,
                  mxLines: 2,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),
                CustomTexfield(
                  txt:
                      'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Aenean est elit, lobortis a mattis\n vel, aliquet ut ligula.',
                  fontSize: 14,
                  mxLines: 3,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 35),
                CustomButton(),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7,
            left: MediaQuery.of(context).size.width / 5,
            right: MediaQuery.of(context).size.width / 5,
            child: Image.asset(
              kVictorImage,
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}
