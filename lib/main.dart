import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notify/helpers/constatns.dart';
import 'Models/note_model.dart';
import 'View/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const Notify());
}

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFF8383),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      // home: const HomeScreen(),
    );
  }
}
