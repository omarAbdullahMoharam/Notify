import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'components/profile_pic.dart';

class MyAccountScreen extends StatefulWidget {
  static String routeName = "/my_account";

  const MyAccountScreen({super.key});

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  // ignore: unused_field
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.grey,
                ),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            Center(
              child: GestureDetector(
                child: const ProfilePic(),
                onTap: () => _showPicker(context),
              ),
            ),
            const Spacer(flex: 6),
            const SizedBox(height: 20),
            buildAccountInfoField("Full Name", "Omar Abdullah", Icons.person),
            const SizedBox(height: 20),
            buildAccountInfoField("Email", "Omar@gmail.com", Icons.email),
            const SizedBox(height: 20),
            buildAccountInfoField(
                "Phone Number", "+20 XXX XXX XXXX", Icons.phone),
            const SizedBox(height: 20),
            buildAccountInfoField(
              "Address",
              "123 Main Street",
              Icons.location_on,
            ),
            const Spacer(
              flex: 12,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8383),
                ),
                onPressed: () {
                  // Function to save changes
                },
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Spacer(
                // flex: 1,
                ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountInfoField(String label, String value, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: value,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
