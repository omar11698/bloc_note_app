import 'package:bloc_note_app/features/load_previous_notes_feature/presentation/widgets/note_card.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/note_entity.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({Key? key, required this.list}) : super(key: key);
  final List<Note> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 0,right: 8.0,top: 20,),
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder:  (context, index) =>  NoteCardWidget(title: list[index].title, body: list[index].body, id: list[index].id),
        itemCount:list.length,

      ),
    );
  }
}


