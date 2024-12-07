import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/constatns.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Center(
        child: Text('Home Screen')), // Replace with your home screen widget
    const Center(
        child: Text('Add Note Screen')), // Replace with your add screen widget
    const Center(
        child:
            Text('Profile Screen')), // Replace with your profile screen widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        padding: const EdgeInsets.all(0),
        height: 70,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            customHome(),
            customPerson(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Color(kPrimaryColor.withOpacity(0.1).value),
        backgroundColor: Color(kPrimaryColor.value),
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  BottomNavigationBarItem customHome() {
    return BottomNavigationBarItem(
      backgroundColor: kPrimaryColor,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/bdafbeef52e74eb0a4fca729dbcf9ff1.svg',
            height: 35,
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

  BottomNavigationBarItem customPerson() {
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
}
