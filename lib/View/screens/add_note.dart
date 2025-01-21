import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/Controller/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notify/Controller/cubits/notes_view_cubit/notes_view_cubit.dart';
import 'package:notify/Models/note_model.dart';
import 'package:notify/helpers/constatns.dart';

import 'home_screen.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    Color containerColor = kColorList[Random().nextInt(kColorList.length)];

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerColor,
        automaticallyImplyLeading: true,
        title: const Text('Add Note'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
        ),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 25,
              children: [
                CustomTitle(
                  containerColor: containerColor,
                  onSaved: (value) => title = value,
                ),
                CustomContent(
                  containerColor: containerColor,
                  onSaved: (value) => content = value,
                ),
                BlocBuilder<AddNoteCubit, AddNoteState>(
                  builder: (context, state) {
                    return CustomButton(
                      containerColor: containerColor,
                      formKey: formKey,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AddNoteCubit>(context).addNote(
                            NoteModel(
                              title: title!,
                              content: content!,
                              color: containerColor.value,
                            ),
                          );
                          BlocProvider.of<NotesCubitCubit>(context)
                              .fetchAllNotes();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a title and content'),
                            ),
                          );
                          AutovalidateMode.always;
                          setState(() {
                            formKey.currentState!.validate();
                          });
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
            const SnackBar(content: Text('Processing Data')),
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

class CustomContent extends StatefulWidget {
  CustomContent({
    super.key,
    required this.containerColor,
    required this.onSaved,
  });
  void Function(String?) onSaved;
  final Color containerColor;

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

class CustomTitle extends StatelessWidget {
  CustomTitle({
    super.key,
    required this.containerColor,
    required this.onSaved,
  });
  void Function(String?) onSaved;
  final Color containerColor;

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
        // initialValue: 'Title',
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
