import 'package:flutter/material.dart';
import '../helpers/constatns.dart';

class CustomNoteColor extends StatelessWidget {
  const CustomNoteColor({
    super.key,
    required this.colorIndex,
    required this.isSelected,
    required this.onSelected,
  });

  final int colorIndex;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4),
      child: GestureDetector(
        onTap: onSelected,
        child: isSelected
            ? Container(
                width: isSelected ? 100 : 80,
                height: isSelected ? 100 : 80,
                decoration: BoxDecoration(
                  color: kColorList[colorIndex],
                  borderRadius: BorderRadius.circular(42),
                  border: isSelected
                      ? Border.all(
                          color: Colors.blueGrey.shade300,
                          width: 4,
                        )
                      : null,
                ),
                child: isSelected
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          size: 44,
                          color: Colors.white,
                        ),
                      )
                    : null,
              )
            : Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kColorList[colorIndex],
                  borderRadius: BorderRadius.circular(42),
                ),
              ),
      ),
    );
  }
}
