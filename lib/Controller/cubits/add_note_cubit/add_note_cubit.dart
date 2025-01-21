import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_note_state.dart';

class AddNoteCubit extends Cubit {
  AddNoteCubit() : super(AddNoteInitial());
}
