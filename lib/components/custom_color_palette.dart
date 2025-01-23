import 'package:flutter/material.dart';
import '../helpers/constatns.dart';
import 'custom_note_color.dart';

class ScrollableColorsPallet extends StatefulWidget {
  final Color containerColor;
  final ValueChanged<Color> onColorSelected;

  const ScrollableColorsPallet({
    super.key,
    required this.containerColor,
    required this.onColorSelected,
  });

  @override
  State<ScrollableColorsPallet> createState() => _ScrollableColorsPalletState();
}

class _ScrollableColorsPalletState extends State<ScrollableColorsPallet> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = kColorList.indexOf(widget.containerColor);
    if (currentIndex == -1) {
      currentIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorList.length,
        itemBuilder: (context, index) {
          return CustomNoteColor(
            colorIndex: index,
            isSelected: currentIndex == index,
            onSelected: () {
              setState(() {
                currentIndex = index;
                widget.onColorSelected(kColorList[index]);
              });
            },
          );
        },
      ),
    );
  }
}
