import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../load_previous_notes_feature/domain/entities/note_entity.dart';
import 'note_widget.dart';

class ShowNoteWidget extends StatelessWidget {
  final Note note ;
  const ShowNoteWidget({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleTextEditingController= TextEditingController();
    TextEditingController bodyTextEditingController= TextEditingController();
    return  NoteWidget(titleTextEditingController: titleTextEditingController, note: note, bodyTextEditingController: bodyTextEditingController);
  }
}

