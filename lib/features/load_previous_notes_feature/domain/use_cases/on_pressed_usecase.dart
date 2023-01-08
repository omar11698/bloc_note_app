import 'package:bloc_note_app/core/error/failures.dart';
import 'package:bloc_note_app/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/note_entity.dart';

abstract class OnPressedUseCase extends BaseUseCase{
}
class OnNotePressedUseCase extends OnPressedUseCase{
  final Note note;

  OnNotePressedUseCase(this.note);

  @override
  Future<Either<Failure, dynamic>> execute() {
    // TODO: implement execute sending data to WriteNote Feature

    throw UnimplementedError();
  }

}