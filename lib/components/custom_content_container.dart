import 'package:flutter/material.dart';

class CustomContent extends StatefulWidget {
  CustomContent({
    super.key,
    required this.containerColor,
    required this.onSaved,
    this.initialContent,
  });
  void Function(String?) onSaved;
  final Color containerColor;
  final String? initialContent;

  @override
  State<CustomContent> createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        initialValue: widget.initialContent,
        onSaved: widget.onSaved,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: 'Content',
          hintStyle: const TextStyle(
            color: Colors.black87,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 2,
              ),
            ],
            fontStyle: FontStyle.italic,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a content';
          }
          return null;
        },
      ),
    );
  }
}
