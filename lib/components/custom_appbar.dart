import 'package:flutter/material.dart';

import 'custom_profile_victor.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Hey Chris ,\nGood Morning",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
          maxLines: 2,
        ),
        Spacer(
          flex: 1,
        ),
        CustomProfileVictor(),
      ],
    );
  }
}
