import 'dart:convert';

import 'package:bloc_note_app/features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constants.dart';
import '../models/note_model.dart';


abstract class RemoteDataSource{
  Future<List<NoteModel>> fetchNotesFromApi();
  void postNoteToApi(NoteModel note);
}



class RemoteDataSourceImpl implements RemoteDataSource{
  Dio dio = Dio();
  @override
  Future<List<NoteModel>> fetchNotesFromApi()async{
    final response = await dio.get(url);

    if(response.statusCode==200)
    {
      dynamic result = jsonDecode(response.data);

      final myListOfNoteModels= List<NoteModel>.from((result["notes"]as List).map((e) => NoteModel.fromJson(e)));

      return myListOfNoteModels;
    }

    else
      {
      throw Exception("failed to get data");
    }
  }

  @override
  void postNoteToApi(NoteModel note) async {
    final request= await dio.post(url,data: note.noteToJson()) ;
  }

}