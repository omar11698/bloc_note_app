import 'package:bloc_note_app/core/event_bus/event_bus.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/manager/loading_notes_bloc.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/widgets/loading_indicator.dart';
import 'package:bloc_note_app/features/save_note_feature/presentation/manager/show_note_bloc.dart';
import 'package:bloc_note_app/features/save_note_feature/presentation/manager/show_note_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../load_previous_notes_feature/domain/entities/note_entity.dart';
import '../manager/show_note_bloc.dart';
import '../widgets/show_note_widget.dart';

class NoteClickedPage extends StatelessWidget {
  final Note note;
  const NoteClickedPage({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowNoteBloc, ShowNoteState>(
      builder: (context, state) {

        if (state is ShowNoteSuccess)
        {
          return ShowNoteWidget(note: note);
        }

        else if(state is ShowNoteInitial)
          {
          return const Center(
            child: Text("there is nothing came to the Note Page to show"),
          );
        }

        else if (state is ShowNoteWaiting)
          {
          debugPrint("we are in loading indicator waiting for event bus  ");
          return const LoadingIndicatorWidget() ;
        }

        else{
          debugPrint("something went wrong the states are fine ");
          return const Center() ;
        }


      },
    );
  }
}
