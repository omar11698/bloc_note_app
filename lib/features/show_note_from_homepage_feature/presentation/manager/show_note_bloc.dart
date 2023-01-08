import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/event_bus/event_bus.dart';
import '../../../load_previous_notes_feature/domain/entities/note_entity.dart';
import '../../../load_previous_notes_feature/presentation/manager/loading_notes_bloc.dart';

part 'show_note_event.dart';
part 'show_note_state.dart';

class ShowNoteBloc extends Bloc<ShowNoteEvent, ShowNoteState> {
  // final LoadingNotesBloc loadingNotesBloc;
  // final StreamSubscription loadNoteStreamSubscription ;


  ShowNoteBloc() : super(ShowNoteInitial()) {

    on<ShowNoteWhileClickedEvent>((event, emit)  {

     debugPrint(" ******* this is the waiting state of showing note  ");
     emit(ShowNoteWaiting());

    debugPrint(" ******* this is the success state of showing note  ");
    emit(ShowNoteSuccess());


    });
  }
}
