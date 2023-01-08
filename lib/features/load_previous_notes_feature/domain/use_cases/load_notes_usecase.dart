import 'package:bloc_note_app/core/error/failures.dart';
import 'package:bloc_note_app/core/usecase/base_usecase.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repository.dart';

class LoadNotesUseCase extends BaseUseCase<void,Future<Either<Failure, List<Note>>>>{

  Repository repository ;
  LoadNotesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Note>>> execute() async {
    final remoteList=await repository.getNotesFromRemoteApi();
    return remoteList ;
  }



}