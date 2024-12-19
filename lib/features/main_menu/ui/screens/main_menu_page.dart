import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/router/route.dart';
import 'package:hangman_game/features/main_menu/domain/entities/word_type_entity.dart';
import 'package:hangman_game/features/main_menu/index.dart';
import 'package:hangman_game/words.dart';

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
          wordList = state.words;
          context.go(AppRoute.homePageRouteName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Main Menu'),
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
            child: const Text(
              'New Game',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              context.push(AppRoute.leaderboardPageRouteName);
            },
            child: const Text(
              'Leaderboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              context.read<MainMenuBloc>().add(LogoutEvent());
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filter(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
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
            height: 32,
          ),
          AppTextButton(
            onPressed: () {
              context.read<MainMenuBloc>().add(GetWordsEvent());
            },
            text: 'Start',
          ),
          const SizedBox(
            height: 24,
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
              fontSize: 20,
              fontWeight: FontWeight.w300,
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
                        fontSize: 18,
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
              width: MediaQuery.of(context).size.width * 0.4,
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
              fontSize: 20,
              fontWeight: FontWeight.w300,
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
                    fontSize: 18,
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
                      fontSize: 18,
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
              width: MediaQuery.of(context).size.width * 0.4,
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
              fontSize: 20,
              fontWeight: FontWeight.w300,
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
                    fontSize: 18,
                  ),
                ),
              ),
              ...wordTypes.map(
                (WordTypeEntity item) => DropdownMenuItem<String>(
                  value: item.name,
                  child: Text(
                    item.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
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
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
        ),
      ],
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
