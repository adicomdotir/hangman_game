import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/bloc/word_list/word_list_bloc.dart';
import 'package:hangman_game/core/bloc/word_list/word_list_event.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/main_menu/index.dart';

import '../../../common/ui/widgets/app_text_button.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final List<String> items = [
    'All Books',
    'Book 1',
    'Book 2',
    'Book 3',
    'Book 4',
    'Book 5',
    'Book 6',
  ];

  String? selectedBook = 'All Books';
  String? selectedLesson = 'All Lessons';
  String? selectedWordType = 'All Types';

  bool filterGame = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainMenuBloc, MainMenuState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.go(AppRoute.loginPageRouteName);
        } else if (state is GetWordsSuccess) {
          context
              .read<WordListBloc>()
              .add(AddWordListEvent(words: state.words));
          if (state.words.isNotEmpty) {
            context.go(AppRoute.homePageRouteName);
          } else {
            showWordsDontExcistDialog(context).then(
              (value) {
                if (context.mounted) {
                  context.read<MainMenuBloc>().add(ChangeStateInitailEvent());
                }
              },
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(
              'Main Menu',
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: _body(context, state),
        );
      },
      buildWhen: (previous, current) {
        return current is! GetWordsSuccess;
      },
    );
  }

  Widget _body(BuildContext context, MainMenuState state) {
    switch (state) {
      case MainMenuLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case MainMenuError():
        return const Center(
          child: Text('Unknown Error'),
        );
      default:
        if (filterGame) {
          return _filter(context);
        }
        return _menu(context);
    }
  }

  SizedBox _menu(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // context.push(AppRoute.homePageRouteName);
              setState(() {
                filterGame = true;
              });
            },
            child: const MenuItemWidget(
              title: 'New Game',
              iconData: Icons.play_circle_outline,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              context.push(AppRoute.practiceModePageRouteName);
            },
            child: const MenuItemWidget(
              title: 'Practice Mode',
              iconData: Icons.fitness_center_outlined,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              context.push(AppRoute.leaderboardPageRouteName);
            },
            child: const MenuItemWidget(
              title: 'Leaderboard',
              iconData: Icons.add_chart_outlined,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              context.read<MainMenuBloc>().add(LogoutEvent());
            },
            child: const MenuItemWidget(
              title: 'Logout',
              iconData: Icons.logout_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Widget _filter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 48,
        ),
        _bookSelectSection(context),
        const SizedBox(
          height: 24,
        ),
        if (selectedBook != null && selectedBook != 'All Books')
          _lessonSelectSection(),
        if (selectedBook != null && selectedBook != 'All Books')
          const SizedBox(
            height: 24,
          ),
        _wordTypeSelectSection(),
        const SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppTextButton(
              onPressed: () {
                context.read<MainMenuBloc>().add(
                      GetWordsEvent(
                        book: _getBookName(selectedBook),
                        lesson: _getLessonCode(selectedLesson),
                        wordType: _getWordTypeCode(selectedWordType),
                      ),
                    );
              },
              text: 'Start',
            ),
            AppTextButton(
              onPressed: () {
                setState(() {
                  filterGame = false;
                });
              },
              text: 'Cancel',
            ),
          ],
        ),
      ],
    );
  }

  Widget _bookSelectSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Text(
            'Book',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedBook,
            onChanged: (String? value) {
              setState(() {
                selectedBook = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.only(left: 16, right: 8),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _lessonSelectSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            '$selectedBook',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            items: [
              const DropdownMenuItem<String>(
                value: 'All Lessons',
                child: Text(
                  'All Lessons',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ...List.generate(
                30,
                (index) => 'Lesson ${index + 1}',
              ).map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
            value: '$selectedLesson',
            onChanged: (String? value) {
              setState(() {
                selectedLesson = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.only(left: 16, right: 8),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _wordTypeSelectSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Text(
            'Word Type',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            items: [
              const DropdownMenuItem<String>(
                value: 'All Types',
                child: Text(
                  'All Types',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ...wordTypes.map(
                (WordTypeEntity item) => DropdownMenuItem<String>(
                  value: item.name,
                  child: Text(
                    item.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
            value: selectedWordType,
            onChanged: (String? value) {
              setState(() {
                selectedWordType = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.only(left: 16, right: 8),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
      ],
    );
  }

  String _getBookName(String? selectedBook) {
    if (selectedBook == null) {
      return '0';
    }
    switch (selectedBook) {
      case 'Book 1':
        return '1';
      case 'Book 2':
        return '2';
      case 'Book 3':
        return '3';
      case 'Book 4':
        return '4';
      case 'Book 5':
        return '5';
      case 'Book 6':
        return '6';
    }
    return '0';
  }

  String _getLessonCode(String? selectedLesson) {
    if (selectedLesson == null || selectedLesson == 'All Lessons') {
      return '0';
    }

    try {
      return selectedLesson.split(' ')[1];
    } on Exception catch (_) {
      return '0';
    }
  }

  int _getWordTypeCode(String? selectedWordType) {
    if (selectedWordType == null) {
      return 0;
    }

    final filteredList = wordTypes.where(
      (wordType) =>
          wordType.name.toLowerCase() == selectedWordType.toLowerCase(),
    );
    if (filteredList.isNotEmpty) {
      return filteredList.first.id;
    }

    return 0;
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    required this.title,
    required this.iconData,
    super.key,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontFamily: 'Fredoka',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
