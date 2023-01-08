part of 'loading_notes_bloc.dart';

@immutable
abstract class LoadingNotesEvent {}
class GettingNotesFromDataSourceEvent extends LoadingNotesEvent{


}
class GettingNotesFromDatabaseEvent extends LoadingNotesEvent{


}

class OnClickedEvent extends LoadingNotesEvent{
  final Note  note ;
  OnClickedEvent({required this.note});
}
