import 'package:flutter/material.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({
    super.key,
    required this.title,
    required this.content,
    required this.color,
  });
  final String title, content;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   right: 0,
        //   // top: 0,
        //   bottom: 0,
        //   child: IconButton(
        //     onPressed: () {
        //       // delete note
        //     },
        //     icon: const Icon(Icons.delete),
        //   ),
        // ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
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
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 22, right: 4),
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
