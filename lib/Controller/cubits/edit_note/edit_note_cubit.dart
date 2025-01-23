import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notify/Models/note_model.dart';
import 'package:notify/helpers/constatns.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
  void updateNote(
    NoteModel note,
    int key,
  ) async {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    await noteBox.putAt(key, note);
    emit(EditNoteSuccess());
  }
}
