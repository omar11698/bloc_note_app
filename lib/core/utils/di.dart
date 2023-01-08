import 'package:bloc_note_app/features/load_previous_notes_feature/domain/use_cases/load_notes_usecase.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/domain/use_cases/localDatabase_usecase.dart';
import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/manager/loading_notes_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/load_previous_notes_feature/data/data_sources/local_data_source.dart';
import '../../features/load_previous_notes_feature/data/data_sources/remote_data_source.dart';
import '../../features/load_previous_notes_feature/data/repositories/repository_imp.dart';
import '../../features/load_previous_notes_feature/domain/repositories/repository.dart';
import '../network/network_info.dart';

final instanceForLoadingPreviousNotes=GetIt.instance;
class DependencyInjection {
  Future<void> initAppModule() async {

    /// internet connection checker
    instanceForLoadingPreviousNotes.registerLazySingleton(() => InternetConnectionChecker());

    /// network info
    instanceForLoadingPreviousNotes.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(instanceForLoadingPreviousNotes()));

    /// remote data source
    instanceForLoadingPreviousNotes.registerLazySingleton<RemoteDataSource>(
            () => RemoteDataSourceImpl());


    /// local data source
    instanceForLoadingPreviousNotes.registerLazySingleton<LocalDataSource>(
            () => LocalDataSourceImpl());


    /// repository
    instanceForLoadingPreviousNotes.registerLazySingleton<Repository>(
            () => RepositoryImpl(instanceForLoadingPreviousNotes(), instanceForLoadingPreviousNotes(), instanceForLoadingPreviousNotes()));

    /// Load Notes Use Case
    instanceForLoadingPreviousNotes.registerLazySingleton<LoadNotesUseCase>(
            () => LoadNotesUseCase(repository:instanceForLoadingPreviousNotes()));

    /// load local data base use case
     instanceForLoadingPreviousNotes.registerLazySingleton<LocalDatabaseUseCase>(() => LocalDatabaseUseCase(repository: instanceForLoadingPreviousNotes()));
  }

}
// instead of doing all of this
// InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
// NetworkInfoImpl networkInfoImpl=NetworkInfoImpl(internetConnectionChecker);
// NetworkInfo networkInfo=networkInfoImpl;
// LocalDataSourceImpl localDataSourceImpl=LocalDataSourceImpl();
// LocalDataSource localDataSource=localDataSourceImpl;
// RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
// RemoteDataSource remoteDataSource = remoteDataSourceImpl;
// RepositoryImpl repositoryImpl =RepositoryImpl(remoteDataSource, localDataSource, networkInfo);
// Repository repository = repositoryImpl;
// LoadNotesUseCase loadNotesUseCase= LoadNotesUseCase(repository: repository);