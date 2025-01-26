import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_entity.dart';

import '../../../../core/bloc/word_list/word_list_bloc.dart';
import '../../../../core/bloc/word_list/word_list_event.dart';
import '../../../common/ui/widgets/app_text_button.dart';
import '../blocs/practice_bloc.dart';

class PracticeModePage extends StatefulWidget {
  const PracticeModePage({super.key});

  @override
  State<PracticeModePage> createState() => _PracticeModePageState();
}

class _PracticeModePageState extends State<PracticeModePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PracticeBloc>(context).add(GetWordsLocalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Practice Mode',
          style: TextStyle(
            fontFamily: 'Fredoka',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocConsumer<PracticeBloc, PracticeState>(
      listener: (context, state) {
        if (state is PracticeSuccess) {
          BlocProvider.of<WordListBloc>(context)
              .add(AddWordListEvent(words: state.words));
        }
      },
      builder: (context, state) {
        if (state is PracticeSuccess) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: _wordSection(state.words),
                ),
                AppTextButton(
                  onPressed: () {
                    context.push(
                      AppRoute.homePageRouteName,
                      extra: {'practiceMode': true},
                    );
                  },
                  text: 'Start',
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          );
        }
        return const Text('State Not Implemented');
      },
    );
  }

  Wrap _wordSection(List<WordEntity> words) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...words.map(
          (e) {
            return Chip(
              label: Text(e.word.toUpperCase()),
              deleteIcon: const Icon(Icons.close, size: 18),
              onDeleted: () {
                BlocProvider.of<PracticeBloc>(context)
                    .add(DeleteWordEvent(e.id));
              },
            );
          },
        ),
      ],
    );
  }
}
