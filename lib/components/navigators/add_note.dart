import 'package:flutter/material.dart';

import '../../helpers/constatns.dart';

BottomNavigationBarItem customAddNavigator() {
  return BottomNavigationBarItem(
    label: '',
    backgroundColor: kPrimaryColor,
    icon: Center(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Color(kPrimaryColor.value),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    ),
  );
}
