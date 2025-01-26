part of 'practice_bloc.dart';

sealed class PracticeState {}

class PracticeInitial extends PracticeState {}

class PracticeError extends PracticeState {}

class PracticeLoading extends PracticeState {}

class PracticeSuccess extends PracticeState {
  PracticeSuccess(this.words);

  final List<WordEntity> words;
}
