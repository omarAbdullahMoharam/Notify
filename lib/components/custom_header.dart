import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'custom_searchbar.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const CustomAppBar(),
          const SizedBox(height: 25),
          Container(
            height: 46,
            width: 335,
            decoration: const BoxDecoration(
              color: Color(0xFFE6E6E6),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Icon(Icons.search),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomSearchBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
