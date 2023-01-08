import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc() : super(AddNoteInitial()) {
    on<AddNoteEvent>((event, emit) {
      // TODO: implement event handler
      if(event is AddNoteEvent){

      }
    });
  }
}
