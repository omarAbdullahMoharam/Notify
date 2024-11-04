import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Hey Chris ,\nGood Morning",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
          maxLines: 2,
        ),
        const Spacer(
          flex: 1,
        ),
        // Container(
        //   width: 80,
        //   height: 80,
        //   clipBehavior: Clip.hardEdge,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(25),
        //   ),
        //   child: Image.asset(
        //     // 'assets/images/8de0ff70-e27f-4add-b884-bad03f400865.jpg',
        //     'assets/images/profile.png',
        //     width: 80,
        //     height: 80,
        //   ),
        // ),
        Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              // border: Border.all(
              //   width: 2,
              // ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/8de0ff70-e27f-4add-b884-bad03f400865.jpg',
                // 'assets/images/profile.png',
                fit: BoxFit.contain,
              ),
            ))
        // const Icon(
        //   Icons.notifications_none_outlined,
        //   size: 30,
        // ),
      ],
    );
  }
}
