import 'package:flutter/material.dart';
import 'package:notify/helpers/constatns.dart';
import 'package:notify/View/screens/add_note.dart';

import '../../components/navigators/add_note.dart';
import '../../components/navigators/home_nav.dart';
import '../../components/navigators/person_nav.dart';
import 'home_screen_body.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreenBody(),
    const AddNote(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          height: MediaQuery.of(context).padding.bottom + 77,
          padding: const EdgeInsets.all(0),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              customHomeNavigator(),
              customAddNavigator(),
              customPersonNavigator(),
            ],
          ),
        ),
      ),
      // floatingActionButton: customFloatingButtonNavigator(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  FloatingActionButton customFloatingButtonNavigator() {
    return
        // left: MediaQuery.of(context).size.width / 2 - 30,
        // bottom: 18,
        FloatingActionButton(
      splashColor: Color(kPrimaryColor.withOpacity(0.55).value),
      backgroundColor: Color(kPrimaryColor.value),
      shape: const CircleBorder(),
      onPressed: () {
        setState(() {
          _currentIndex = 1;
        });
      },
      child: const Icon(
        Icons.add,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
