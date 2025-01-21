import 'package:flutter/material.dart';
import 'package:notify/helpers/constatns.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.formKey,
    required this.onPressed,
    required this.containerColor,
  });
  void Function() onPressed;
  final GlobalKey<FormState> formKey;
  final Color containerColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Note Added Successfully ✅'),
              backgroundColor: kPrimaryColor,
            ),
          );
          widget.formKey.currentState!.save();
          widget.onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: widget.containerColor,
      ),
      child: const Text(
        'Save',
        style: TextStyle(color: Colors.black87, fontSize: 18),
      ),
    );
  }
}
