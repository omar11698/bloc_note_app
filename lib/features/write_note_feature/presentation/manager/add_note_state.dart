part of 'add_note_bloc.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class LoadingNotesState extends AddNoteState{}
class SuccessShowingState extends AddNoteState{}
class FailedShowingState extends AddNoteState{}
