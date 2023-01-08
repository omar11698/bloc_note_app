import 'package:bloc_note_app/core/error/failures.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'package:dartz/dartz.dart';

abstract class  Repository{
  Future<Either<Failure,List<Note>>> getNotesFromRemoteApi();
  Future<Either<Failure,List<Note>>> getNotesFromLocalDb();
}