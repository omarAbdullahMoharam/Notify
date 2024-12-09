import 'package:flutter/material.dart';

import '../../helpers/constatns.dart';

BottomNavigationBarItem customAddNavigator() {
  return BottomNavigationBarItem(
    label: '',
    backgroundColor: kPrimaryColor,
    icon: Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        // color: Color(kPrimaryColor.value),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 40,
      ),
    ),
  );
}
