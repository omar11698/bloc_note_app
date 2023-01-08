import 'package:bloc_note_app/core/sqflite/sqlflite_db.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/data/models/note_model.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/manager/loading_notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../load_previous_notes_feature/domain/entities/note_entity.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
    required this.titleTextEditingController,
    required this.note,
    required this.bodyTextEditingController,
  }) : super(key: key);

  final TextEditingController titleTextEditingController;
  final Note note;
  final TextEditingController bodyTextEditingController;

  @override
  Widget build(BuildContext context) {
    SqfLiteDB sqfLiteDB = SqfLiteDB();
    List<Note> listComingFromRemoteDataSource = [];
    List<Note> listHavingBothRemoteAndLocalData = [];

    return Scaffold(
        appBar: AppBar(backgroundColor: appBarColor, title: const Text('My Note'), leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back)), elevation: 0,),
        body: Container(
          height: 800,
          width: 600,
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: ivoryAccentColor),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextField(
                  controller: titleTextEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: note.title,
                  ),
                ),

                TextField(
                  controller: bodyTextEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: note.body,
                  ),

                ),


              ],
            ),
          ),
        ),
        floatingActionButton: BlocListener<LoadingNotesBloc, LoadingNotesState>(
          listener: (context, state) async {
            /// adding the remote data source in database to show them

            if (state is LoadingNotesSuccess) {
              listComingFromRemoteDataSource = state.list;

              for (int i = 0; i < listComingFromRemoteDataSource.length; i++) {
                debugPrint('${listComingFromRemoteDataSource[i]}');
                await sqfLiteDB.searchElementsInDatabase(
                    NoteModel(id: listComingFromRemoteDataSource[i].id, title: listComingFromRemoteDataSource[i].title, body: listComingFromRemoteDataSource[i].body).noteToJson());
                var results = await sqfLiteDB.readData("SELECT * FROM Notes");
                debugPrint(results);
                listHavingBothRemoteAndLocalData.addAll(listComingFromRemoteDataSource);
              }
            }
            else if (state is LoadingNotesFromDatabaseSuccess) {
              listHavingBothRemoteAndLocalData.addAll(state.list);
            }
          },
          child: Row(
            children: [

              /// delete note button

              FloatingActionButton.extended(

                onPressed: () {
                  debugPrint("the deleted item is ${note.id}");
                  sqfLiteDB.deleteData('DELETE FROM Notes WHERE id = ${note.id}');

                  BlocProvider.of<LoadingNotesBloc>(context).add(GettingNotesFromDatabaseEvent());
                  Navigator.pop(context);
                },
                heroTag: false,
                label: const Text("Delete", style: TextStyle(color: Colors.black),),
                icon: const Icon(Icons.delete),


              ),
              BlocListener<LoadingNotesBloc, LoadingNotesState>(
                listener: (context, state) {
                 if(state is LoadingNotesSuccess){
                   LoadingNotesSuccess(state.list).copyWith(listHavingBothRemoteAndLocalData);
                 }
                },
                child: FloatingActionButton.extended(

                  onPressed: () async
                  {


                    ///starting the database

                    final myDataBase = await sqfLiteDB.database;

                    ///inserting into database
                    final noteInsertedToDataBase = Note(id: note.id, title: titleTextEditingController.text, body: bodyTextEditingController.text);
                    final response = await sqfLiteDB.readData('SELECT * FROM Notes');

                    debugPrint("I AM SQL DB RESPONSE : $response");


                    ///note already exist update it
                    ///update else
                    ///insert note to db

                    await sqfLiteDB.searchElementsInDatabase(NoteModel(id: note.id, title: titleTextEditingController.text, body: bodyTextEditingController.text).noteToJson());

                    /// routing to the main screen to see the notes
                    BlocProvider.of<LoadingNotesBloc>(context).add(GettingNotesFromDatabaseEvent());
                    Navigator.pop(context);
                  },

                  label: const Text("Save Note", style: TextStyle(color: Colors.black),),
                  icon: const Icon(Icons.save, color: Colors.black,),
                  backgroundColor: floatingActionButtonColor,
                ),
              ),
            ],
          ),
        )
    );
  }
}