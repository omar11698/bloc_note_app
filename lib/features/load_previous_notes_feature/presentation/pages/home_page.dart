import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/manager/loading_notes_bloc.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/widgets/loading_indicator.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/widgets/notes_list_widget.dart';
import 'package:bloc_note_app/features/write_note_feature/presentation/pages/write_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/note_entity.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingNotesBloc, LoadingNotesState>(builder: (context, state) {
      if (state is LoadingNotesWaiting) {
        return const LoadingIndicatorWidget();
      }
      else {
        return const ContentWidget();
      }
    });
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Note> list =[];
    return BlocBuilder<LoadingNotesBloc, LoadingNotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: const Text("My Notes"),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              /// adding new note

              if (state is LoadingNotesSuccess) {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => WriteNote(id: state.list.length)));
              }
              else if (state is LoadingNotesFromDatabaseSuccess) {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => WriteNote(id: state.list.length)));
              }
            },
            tooltip: 'Increment',
            backgroundColor: floatingActionButtonColor,
            child: const Icon(Icons.add),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    /// Remote Source notes
                    BlocBuilder<LoadingNotesBloc, LoadingNotesState>(

                      builder: (context, state) {
                        if (state is LoadingNotesInitial)
                        {
                          return const Center(child: Text('welcome to your notes omar '));
                        }

                        else if (state is LoadingNotesSuccess )
                        {
                          list=state.list;
                          BlocProvider.of<LoadingNotesBloc>(context).add(GettingNotesFromDatabaseEvent());
                          return  NotesListWidget(list: state.list);

                        }
                        else if (state is LoadingNotesFromDatabaseSuccess)
                        {

                          return NotesListWidget(list: list);

                        }

                        else if (state is LoadingNotesWaiting)
                        {

                          return const Center(
                            child: SizedBox(
                                height: 200,
                                width: 200,
                                child: LoadingIndicatorWidget()),
                          );

                        }

                        else {

                          return const Center(child: Text("there is no state ya omar"),);

                        }


                      },
                    ),
                    /// Local Source notes
                    BlocBuilder<LoadingNotesBloc,LoadingNotesState>(builder: (context,state){

                      if(state is LoadingNotesFromDatabaseSuccess)
                      {
                        return NotesListWidget(list: state.list);

                      }else{
                        return const Text("something went wrong in the states of LoadingNoteState");
                      }
                    }),
              ],
            ),
          ),
        );
      },

    );
  }
}
