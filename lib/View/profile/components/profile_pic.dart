import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 170,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                "assets/images/profile.png",
              ),
              radius: 60,
            ),
          ),
          Positioned(
            right: 2,
            bottom: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(
                      color: Colors.black,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera_Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
