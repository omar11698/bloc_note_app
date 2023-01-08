import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_note_event.dart';
part 'show_note_state.dart';

class SaveNoteBloc extends Bloc<SaveNoteEvent, SaveNoteState> {
  SaveNoteBloc() : super(SaveNoteInitial()) {
    on<SaveNoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
