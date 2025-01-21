import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notes_view_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
}
