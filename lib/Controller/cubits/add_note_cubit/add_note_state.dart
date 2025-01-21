class AddNote {}

class AddNoteInitial extends AddNote {}

class AddNoteLoading extends AddNote {}

class AddNoteSuccess extends AddNote {}

class AddNoteFailure extends AddNote {
  final String error;
  AddNoteFailure(this.error);
}
