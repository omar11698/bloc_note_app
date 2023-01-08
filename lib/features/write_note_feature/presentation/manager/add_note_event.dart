part of 'add_note_bloc.dart';

@immutable
abstract class AddNoteEvent {}
class SaveNoteSubmitted extends AddNoteEvent{}
class CancelAddingNote extends AddNoteEvent{}


