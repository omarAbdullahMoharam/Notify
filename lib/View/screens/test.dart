// import 'package:flutter/material.dart';
// import '../components/navigators/home_nav.dart';
// import '../components/navigators/person_nav.dart';
// import '../helpers/constatns.dart';

// class HomeScreenBody extends StatefulWidget {
//   const HomeScreenBody({super.key});

//   @override
//   HomeScreenState createState() => HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreenBody> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     const Center(child: Text('Home Screen')),
//     const Center(child: Text('Add Note Screen')),
//     const Center(child: Text('Profile Screen')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       // bottomNavigationBar: BottomAppBar(
//       //   shape: const CircularNotchedRectangle(),
//       //   padding: const EdgeInsets.all(0),
//       //   height: 70,
//       //   child: BottomNavigationBar(
//       //     currentIndex: _currentIndex,
//       //     onTap: (index) {
//       //       setState(() {
//       //         _currentIndex = index;
//       //       });
//       //     },
//       //     items: [
//       //       customHomeNavigator(),
//       //       customPersonNavigator(),
//       //     ],
//       //   ),
//       // ),
//       // floatingActionButton: FloatingActionButton(
//       //   splashColor: Color(kPrimaryColor.withOpacity(0.1).value),
//       //   backgroundColor: Color(kPrimaryColor.value),
//       //   shape: const CircleBorder(),
//       //   onPressed: () {
//       //     setState(() {
//       //       _currentIndex = 1;
//       //     });
//       //   },
//       //   child: const Icon(
//       //     Icons.add,
//       //     color: Colors.white,
//       //   ),
//       // ),
//       // floatingActionButtonLocation:
//       //     FloatingActionButtonLocation.miniCenterDocked,
//     );
//   }
// }
