import 'package:flutter/material.dart';

Future<void> areYouSureDialog({
  required String title,
  required String content,
  required BuildContext context,
  required Function action,
  bool isKeyInvolved = false,
  int key = 0,
}) {
  return showDialog(
    context: context,
    builder: (context) =>
//     Platform.isIOS
//         ?
// // Cupertino Dialog Box
//         CupertinoAlertDialog(
//             title: Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black,
//                 fontSize: 16,
//               ),
//             ),
//             content: Text(content),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () => action(),
//                   child: const Text('Yes'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: const Text('Cancel'),
//                 ),
//               ),
//             ],
//           ):

// Material Dialog Box

        AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      content: Text(content),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => action(),
          child: const Text('Yes'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
