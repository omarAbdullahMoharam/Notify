part of 'notes_view_cubit.dart';

sealed class NotesCubitState {}

// EMPTY STATE
final class NotesInitialState extends NotesCubitState {}

final class NotesSuccess extends NotesCubitState {
  final List<NoteModel> notes;
  NotesSuccess(this.notes);
}

final class NotesErrorState extends NotesCubitState {
  final String message;
  NotesErrorState(this.message);
}
