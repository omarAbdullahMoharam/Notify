import 'package:flutter/material.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({
    super.key,
    required this.title,
    required this.content,
  });
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffBFE5FA),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 18, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6, bottom: 22, right: 4),
              child: Text(
                'Content is here, tell me how are you and how your mother and your father',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            const Text(
              '20 May',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
