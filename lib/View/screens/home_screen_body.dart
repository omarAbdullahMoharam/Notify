import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/Controller/cubits/notes_view_cubit/notes_view_cubit.dart';
import 'package:notify/helpers/constatns.dart';

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
          if (state is NotesInitialState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomHeader(),
                const Spacer(),
                Icon(
                  Icons.delete,
                  color: kPrimaryColor,
                  size: MediaQuery.of(context).size.width * 0.35,
                ),
                const SizedBox(height: 15),
                const Text(
                  'No notes available',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            );
          } else if (state is NotesSuccess) {
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
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final note = state.notes[index];
                      return (CustomNote(
                        // title: note.title,
                        // content: note.content,
                        // color: note.color,
                        note: note,
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
