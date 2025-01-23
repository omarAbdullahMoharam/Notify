import 'package:flutter/material.dart';
import 'package:notify/helpers/constatns.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.formKey,
    required this.onPressed,
    required this.containerColor,
    required this.snackBarMessage,
  });
  void Function() onPressed;
  final GlobalKey<FormState> formKey;
  final Color containerColor;
  final bool snackBarMessage;

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
              duration: const Duration(seconds: 2),
              content: widget.snackBarMessage
                  ? const Text('Note Added Successfully ✅')
                  : const Text('Note Updated Successfully ✅'),
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          );
          widget.formKey.currentState!.save();
          widget.onPressed();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: const Text(
                'Please enter a Title and Content',
              ),
              duration: const Duration(seconds: 3),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              width: 400,
              backgroundColor: Colors.red.shade300,
            ),
          );
          setState(() {
            widget.formKey.currentState!.validate();
            Future.delayed(const Duration(seconds: 3), () {
              widget.formKey.currentState!.reset();
            });
          });
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
