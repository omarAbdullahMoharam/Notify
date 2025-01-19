import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem customPersonNavigator() {
  return const BottomNavigationBarItem(
    icon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.person,
          size: 32,
          color: Colors.black,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          'Person',
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
