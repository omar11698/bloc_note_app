part of 'show_note_bloc.dart';

@immutable
abstract class ShowNoteState {}

class ShowNoteInitial extends ShowNoteState{}
class ShowNoteSuccess extends ShowNoteState{}
class ShowNoteFailure extends ShowNoteState{}
class ShowNoteWaiting extends ShowNoteState{}

