import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/Controller/cubits/notes_view_cubit/notes_view_cubit.dart';

import '../../components/custom_header.dart';
import '../../components/custom_note_card.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<NotesCubitCubit, NotesCubitState>(
        builder: (context, state) {
          if (state is NotesSuccess) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomHeader(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final note = state.notes[index];
                      return (CustomNote(
                        title: note.title,
                        content: note.content,
                        color: note.color,
                      ));
                    },
                    childCount: state.notes.length,
                  ),
                ),
              ],
            );
          } else if (state is NotesErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No notes available'));
          }
        },
      ),
    );
  }
}
