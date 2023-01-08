import 'package:bloc_note_app/core/error/failures.dart';
import 'package:bloc_note_app/core/usecase/base_usecase.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/note_entity.dart';

class LocalDatabaseUseCase extends BaseUseCase<void,Future<Either<Failure, List<Note>>>>{
  final Repository repository ;

  LocalDatabaseUseCase({required this.repository});
  @override
  Future<Either<Failure, dynamic>> execute() {

    return repository.getNotesFromLocalDb();


  }

}