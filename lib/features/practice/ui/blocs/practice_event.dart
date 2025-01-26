part of 'practice_bloc.dart';

abstract class PracticeEvent {}

class GetWordsLocalEvent extends PracticeEvent {}

class DeleteWordEvent extends PracticeEvent {
  DeleteWordEvent(this.id);
  final int id;
}
