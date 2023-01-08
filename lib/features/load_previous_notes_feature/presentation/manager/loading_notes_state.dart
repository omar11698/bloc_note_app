part of 'loading_notes_bloc.dart';

@immutable
abstract class LoadingNotesState {}

class LoadingNotesInitial extends LoadingNotesState {}
class LoadingNotesWaiting extends LoadingNotesState {}
class LoadingNotesSuccess extends LoadingNotesState {
  final List<Note> _list ;
  LoadingNotesSuccess(this._list);
  List<Note> get list => _list;
  copyWith(List<Note>? listHavingBothRemoteAndLocalData,
  )
  {


    return   LoadingNotesSuccess(listHavingBothRemoteAndLocalData?? this.list);
}
  //
  // set list(List<Note> value) {
  //   _list = value;
  // }
}
class LoadingNotesFromDatabaseSuccess extends LoadingNotesState {
  final List<Note> _list ;
  LoadingNotesFromDatabaseSuccess(this._list);
  List<Note> get list => _list;
}
class LoadingNotesFailed extends LoadingNotesState {
  final String message;
  LoadingNotesFailed({required this.message});
}
class BothSourcesState extends LoadingNotesState{
  final List<Note> list;
  BothSourcesState({required this.list});
}
class OnClickNoteSuccess extends LoadingNotesState {}

