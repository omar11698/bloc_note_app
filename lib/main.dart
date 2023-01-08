import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/manager/loading_notes_bloc.dart';
import 'package:bloc_note_app/features/save_note_feature/presentation/manager/show_note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/utils/di.dart';
import 'features/load_previous_notes_feature/presentation/pages/home_page.dart';
import 'features/show_note_from_homepage_feature/presentation/manager/show_note_bloc.dart';

void main() {

  DependencyInjection().initAppModule();
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  },
  blocObserver:MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<LoadingNotesBloc>(
        create: (BuildContext context) => LoadingNotesBloc(instanceForLoadingPreviousNotes(),instanceForLoadingPreviousNotes())..add(GettingNotesFromDataSourceEvent()),
    ),
    BlocProvider<ShowNoteBloc>(
    create: (BuildContext context)=> ShowNoteBloc()..add(ShowNoteWhileClickedEvent())),
    ],

child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>const MyHomePage(),
        // MyHomePage(title: 'MyProvider HomeScreen')
        // '/enlargedNoteScreen':(context)=>const ShowNoteView(),
      },
    ));
  }
}

