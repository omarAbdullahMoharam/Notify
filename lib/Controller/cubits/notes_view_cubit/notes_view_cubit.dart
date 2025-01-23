import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notify/Models/note_model.dart';
import 'package:notify/helpers/constatns.dart';

part 'notes_view_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesInitialState());
  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      var notes = notesBox.values.toList();
      if (notes.isEmpty) {
        log("messages: 'No notes available'");
        emit(NotesInitialState());
        return;
      }
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesErrorState('Error fetching notes'));
      log(e.toString());
    }
  }

  deleteNoteAt(int noteKey) async {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.delete(noteKey);
      fetchAllNotes();
      emit(NotesSuccess(notesBox.values.toList()));
      if (notesBox.isEmpty) {
        notesBox.clear();
        emit(NotesInitialState());
      }
    } catch (e) {
      emit(NotesErrorState('Error Deleting note⚠️'));
      log(e.toString());
    }
  }
}
