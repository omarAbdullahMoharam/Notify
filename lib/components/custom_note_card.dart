import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/cubits/notes_view_cubit/notes_view_cubit.dart';
import '../Models/note_model.dart';
import 'delete_dialog.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({
    super.key,
    // required this.title,
    // required this.content,
    // required this.color,
    // required this.date,
    required this.note,
  });
  // final String title, content;

  // final int color;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 220,
          height: 200,
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
              right: 4,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 22, right: 4),
                  child: Text(
                    note.content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 18,
          child: Text(
            note.date,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 10,
          child: IconButton(
            onPressed: () {
              deleteDialog(
                key: note.key,
                context: context,
                action: () {
                  BlocProvider.of<NotesCubitCubit>(context)
                      .deleteNoteAt(note.key);
                  Navigator.of(context).pop();
                },
              );
            },
            icon: const Icon(Icons.delete, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
