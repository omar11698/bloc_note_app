import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../features/load_previous_notes_feature/domain/entities/note_entity.dart';

class DataBaseHelper{

  getDataBase()async{
// Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

// Delete the database
//   await deleteDatabase(path);

// open the database
  Database database = await openDatabase(path, version: 1,
  onCreate: (Database db, int version,) async {
  // When creating the db, create the table
  print("CREATING YOUR DATABASE &&&&&&&&&&&&&&&&&")  ;
  await db.transaction((txn) => txn.execute(
      'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, body TEXT)'));
  },
    
);
  return database;
  }

  addNoteToDatabase(Note note, Database database )async{
      print("INSERTING YOUR DATABASE &&&&&&&&&&&&&&&&&");
      return await database.transaction((txn) => txn.rawInsert('INSERT INTO Notes(id, title, body) VALUES(${note.id},"${note.title}","${note.body}")'));
  }

  getDataFromDatabase(Database database) async {
    print("SELECTING DATA FROM YOUR DATABASE &&&&&&&&&&&&&&&&&")  ;
    final response=await database.transaction((txn) => txn.rawQuery('SELECT * FROM Notes'));
    print("*************************here is your response:$response");
    return response;
  }

}
