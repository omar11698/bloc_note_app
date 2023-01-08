
import 'package:bloc_note_app/features/load_previous_notes_feature/data/models/note_model.dart';

import '../../../../core/sqflite/sqlflite_db.dart';

abstract class LocalDataSource{

  Future<List<NoteModel>> getNoteFromDb();
}
class LocalDataSourceImpl extends LocalDataSource {

  @override
  Future<List<NoteModel>> getNoteFromDb() async {
    SqfLiteDB sqflite= SqfLiteDB();
    final db= await sqflite.database;
    final listOfMap= await sqflite.readData('SELECT * FROM Notes');
    final dbListOfNotes=List<NoteModel>.from(listOfMap.map((note) => NoteModel.fromJson(note)));
    return dbListOfNotes;
  }
  }