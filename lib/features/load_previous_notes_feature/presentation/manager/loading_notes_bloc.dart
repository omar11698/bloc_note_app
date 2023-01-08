import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:bloc_note_app/features/load_previous_notes_feature/domain/use_cases/localDatabase_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/use_cases/load_notes_usecase.dart';

part 'loading_notes_event.dart';
part 'loading_notes_state.dart';

class LoadingNotesBloc extends Bloc<LoadingNotesEvent, LoadingNotesState> {
  final LoadNotesUseCase loadNotesUseCase;
  final LocalDatabaseUseCase localDatabaseUseCase;

  LoadingNotesBloc(this.loadNotesUseCase, this.localDatabaseUseCase) : super(LoadingNotesInitial())
  {

    on<GettingNotesFromDataSourceEvent>((event, emit) async{
        emit(LoadingNotesWaiting());
        try
        {
          (await  loadNotesUseCase.execute()).fold(

                  (l) {

                emit(LoadingNotesFailed(message: 'the data base not send the notes'));

              },

                  (r) {

                emit(LoadingNotesSuccess(r));

              });

        }
        on ServerFailure catch (catchError) {
          print("didn't even try to take your problem seriuosly ");
        }
        // emit(LoadingNotesInitial());

    });
    on<GettingNotesFromDatabaseEvent>((event, emit) async{
      // emit(LoadingNotesWaiting());
      try{

        (await localDatabaseUseCase.execute()).fold(
                (l) => Left(l),
                (r) {
                      return emit(LoadingNotesFromDatabaseSuccess(r));
                    }
        );



    }
    on ServerFailure   catch (catchError){
        print("something");
    }

    });
  }
}
