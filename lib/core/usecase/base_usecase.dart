import 'package:bloc_note_app/features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, dynamic>>execute();
}
