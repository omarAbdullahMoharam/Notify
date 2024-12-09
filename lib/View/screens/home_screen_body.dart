import 'package:flutter/material.dart';

import '../../components/custom_header.dart';
import '../../components/custom_note_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
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
            delegate: SliverChildListDelegate(
              const [
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                ),
                CustomNote(
                  title: 'hello',
                  content: 'Welcome Omar',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
