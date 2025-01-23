import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({
    super.key,
    required this.containerColor,
    required this.onSaved,
    this.initialTitle,
  });
  void Function(String?) onSaved;
  final Color containerColor;
  final String? initialTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        initialValue: initialTitle,
        onSaved: onSaved,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          // floatingLabelBehavior: FloatingLabelBehavior.auto,
          // underline: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          fillColor: containerColor,
          hintText: 'Title',
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            color: Colors.black87,
            shadows: const [
              Shadow(
                color: Colors.black,
                blurRadius: 2,
              ),
            ],
            fontStyle: FontStyle.italic,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            backgroundColor: containerColor,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a title';
          }
          return null;
        },
      ),
    );
  }
}
