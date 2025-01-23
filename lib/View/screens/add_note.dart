import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notify/Controller/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notify/Controller/cubits/edit_note/edit_note_cubit.dart';
import 'package:notify/Controller/cubits/notes_view_cubit/notes_view_cubit.dart';
import 'package:notify/Models/note_model.dart';
import 'package:notify/helpers/constatns.dart';
import '../../components/custom_color_palette.dart';
import '../../components/custom_content_container.dart';
import '../../components/custom_save_button.dart';
import '../../components/custom_title_container.dart';
import 'home_screen.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key, this.note});
  final NoteModel? note;
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title, content;

  late Color containerColor;
  @override
  void initState() {
    containerColor = kColorList[Random().nextInt(kColorList.length)];
    if (widget.note != null) {
      containerColor = Color(widget.note!.color);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.note == null ? containerColor : Color(widget.note!.color),
        automaticallyImplyLeading: true,
        title: widget.note == null
            ? const Text('Add Note')
            : const Text('Edit Note'),
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AddNoteCubit>(
            create: (context) => AddNoteCubit(),
          ),
          BlocProvider<EditNoteCubit>(
            create: (context) => EditNoteCubit(),
          ),
        ],
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                spacing: 10,
                children: [
                  if (widget.note != null)
                    CustomTitle(
                      containerColor: widget.note == null
                          ? containerColor
                          : Color(widget.note!.color),
                      initialTitle: widget.note!.title,
                      onSaved: (value) => title = value!,
                    ),
                  if (widget.note != null)
                    CustomContent(
                      containerColor: widget.note == null
                          ? containerColor
                          : Color(
                              widget.note!.color,
                            ),
                      initialContent: widget.note!.content,
                      onSaved: (value) => content = value!,
                    ),
                  if (widget.note == null)
                    CustomTitle(
                      containerColor: containerColor,
                      onSaved: (value) => title = value!,
                    ),
                  if (widget.note == null)
                    CustomContent(
                      containerColor: containerColor,
                      onSaved: (value) => content = value!,
                    ),
                  ScrollableColorsPallet(
                    containerColor: containerColor,
                    onColorSelected: (color) {
                      setState(() {
                        containerColor = color;
                      });
                    },
                  ),
                  BlocBuilder<AddNoteCubit, AddNoteState>(
                    builder: (context, state) {
                      return CustomButton(
                        snackBarMessage: widget.note == null,
                        containerColor: containerColor,
                        formKey: formKey,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final formattedDate =
                                DateFormat('d MMM').format(DateTime.now());
                            formKey.currentState!.save();
                            if (widget.note != null) {
                              BlocProvider.of<EditNoteCubit>(context)
                                  .updateNote(
                                NoteModel(
                                  title: title,
                                  content: content,
                                  color: containerColor.value,
                                  date: formattedDate,
                                ),
                                widget.note!.key,
                              );
                            } else {
                              BlocProvider.of<AddNoteCubit>(context).addNote(
                                NoteModel(
                                  title: title,
                                  content: content,
                                  color: containerColor.value,
                                  date: formattedDate,
                                ),
                              );
                            }
                            BlocProvider.of<NotesCubitCubit>(context)
                                .fetchAllNotes();
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                if (mounted) {
                                  Navigator.push(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              },
                            );
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
