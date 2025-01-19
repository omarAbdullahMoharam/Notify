import 'package:flutter/material.dart';
import 'package:notify/helpers/constatns.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(kPrimaryColor.value),
        appBar: AppBar(
          backgroundColor: Color(kPrimaryColor.value),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.indigo,
            ),
          ],
        ));
  }
}
