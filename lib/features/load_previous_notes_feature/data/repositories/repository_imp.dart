import 'package:bloc_note_app/core/error/failures.dart';
import 'package:bloc_note_app/core/network/network_info.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/data/data_sources/local_data_source.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/data/data_sources/remote_data_source.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/data/models/note_model.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/domain/entities/note_entity.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';


class RepositoryImpl implements Repository{
    final RemoteDataSource _remoteDataSource;
    final LocalDataSource _localDataSource;
    final NetworkInfo _networkInfo;


    RepositoryImpl(this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure,List<Note>>> getNotesFromRemoteApi() async {
    print('b3ml getNotesFromRemoteApi mn repository imp ');
      try{
        List<NoteModel> myListOfNotes=await _remoteDataSource.fetchNotesFromApi();
        print(myListOfNotes);
        return Right(myListOfNotes);
      }
      on ServerFailure catch (serverError){
        return Left(serverError);
      }


  }

  @override
  Future<Either<Failure, List<Note>>> getNotesFromLocalDb() async{
    try{

      List<NoteModel> myListOfNotes=   await   _localDataSource.getNoteFromDb();
      return(Right(myListOfNotes));


    }
    on ServerFailure catch (serverError){
      return Left(serverError);
    }
  }

  //todo:make the local fetching of notes here
  // Future<Either<Failure,List<Note>>> getNotesFromCache() async{}


}