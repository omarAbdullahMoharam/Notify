import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 260,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Color(0xFFE6E6E6),
          label: Text('Search'),
          labelStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
