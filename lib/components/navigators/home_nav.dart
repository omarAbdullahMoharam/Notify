import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/constatns.dart';

BottomNavigationBarItem customHomeNavigator() {
  return BottomNavigationBarItem(
    backgroundColor: kPrimaryColor,
    icon: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/bdafbeef52e74eb0a4fca729dbcf9ff1.svg',
          height: 25,
          width: 35,
        ),
        const SizedBox(
          width: 12,
        ),
        const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        )
      ],
    ),
    label: '',
  );
}
