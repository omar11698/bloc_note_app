import 'package:bloc_note_app/features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'package:flutter/cupertino.dart';

class NoteModel extends Note{

  const NoteModel({required int id ,required String title, required String body}) : super(id:id,title: title,body: body);

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
  Map<String,dynamic> noteToJson(){
    return {'id':id,'title':title,'body':body};
  }

  void _updateId(input){
    // id=input;
  }
}
