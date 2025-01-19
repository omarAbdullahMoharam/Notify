import 'package:flutter/material.dart';

class CustomProfileVictor extends StatelessWidget {
  const CustomProfileVictor({
    this.width,
    this.height,
    super.key,
  });
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: height ?? 105,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            child: Image.asset(
              'assets/images/profile.png',
              width: 92,
              height: 101,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
