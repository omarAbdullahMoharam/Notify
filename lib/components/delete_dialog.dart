import 'package:flutter/material.dart';
import 'ensure_dialog.dart';

void deleteDialog({
  required int key,
  required BuildContext context,
  required Function action,
}) {
  areYouSureDialog(
    title: 'Delete item ⚠️',
    content: 'Are you sure you want to delete item?',
    context: context,
    action: action,
  );
}
