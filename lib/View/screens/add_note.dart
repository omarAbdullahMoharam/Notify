import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notify/Controller/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notify/Controller/cubits/notes_view_cubit/notes_view_cubit.dart';
import 'package:notify/Models/note_model.dart';
import 'package:notify/helpers/constatns.dart';

import '../../components/custom_content_container.dart';
import '../../components/custom_save_button.dart';
import '../../components/custom_title_container.dart';
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                            final formattedDate =
                                DateFormat('d MMM').format(DateTime.now());

                            BlocProvider.of<AddNoteCubit>(context).addNote(
                              NoteModel(
                                title: title!,
                                content: content!,
                                color: containerColor.value,
                                date: formattedDate,
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
                                content:
                                    Text('Please enter a title and content'),
                              ),
                            );
                            AutovalidateMode.always;
                            formKey.currentState!.validate();
                            setState(() {});
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
      ),
    );
  }
}
