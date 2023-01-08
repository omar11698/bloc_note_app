import 'dart:async';

import 'package:bloc_note_app/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import '../../features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'note_fields.dart';


class SqfLiteDB
{
  static SqfLiteDB instance=SqfLiteDB();
  static  Database? _database;

  SqfLiteDB();


   Future<Database?> get database async{
    if(_database!=null){ return _database!;}

    _database =await  _init('omar.db');
    return _database;
  }

  Future<Database>  _init(String dataBaseName) async{

    final dbPath= await getDatabasesPath();
    final path =join(dbPath,dataBaseName);
    return await openDatabase(path,version: 1,onCreate: createDB);

  }

  Future createDB (Database db ,int version )async{
     // const idType='INTEGER PRIMARY KEY AUTOINCREMENT';
     // const titleType='TEXT NOT NULL';
     // const bodyType='TEXT NOT NULL';

    await db.transaction((txn) => txn.execute(
        'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, body TEXT)'));


  }

  Future close() async{
     final db=await instance.database;
     db?.close();
  }

  openDB()async{
    var db = await  openDatabase('my_db.db');
  }

/// read returns list of map
readData  (String sql) async{
     Database? myDB=await database;
     Future<List<Map<String, Object?>>> response= myDB!.transaction((txn) => txn.rawQuery(sql));
     return response;
}

/// inserts the no of the row inserted
  addNoteToDatabase(Note note, Database? database )async{
    print("INSERTING YOUR DATABASE &&&&&&&&&&&&&&&&&");
    return await database?.transaction((txn) => txn.rawInsert('INSERT INTO Notes(id, title, body) VALUES(${note.id},"${note.title}","${note.body}")'));
  }

/// returns 0 if success 1 if failed
updateData(String sql) async{
     Database? myDB=await database;
     Future<int> response= myDB!.transaction((txn) => txn.rawUpdate(sql));
     return response;
}
/// returns 0 if success 1 if failed
deleteData(String sql) async{
     Database? myDB=await database;
     Future<int> response= myDB!.transaction((txn) => txn.rawDelete(sql));
     return response;
}

searchElementsInDatabase( Map<String,Object?> note )async{

  Database? myDB=await database;
  Future<int> response= myDB!.transaction((txn) => txn.insert("Notes",note,conflictAlgorithm: ConflictAlgorithm.replace));


}




}