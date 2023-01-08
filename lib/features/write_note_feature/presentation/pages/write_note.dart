import 'package:flutter/cupertino.dart';
import '../../../load_previous_notes_feature/domain/entities/note_entity.dart';
import '../../../show_note_from_homepage_feature/presentation/widgets/note_widget.dart';

class WriteNote extends StatelessWidget {
  final int id;
  const WriteNote({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleTextEditingController= TextEditingController();
    TextEditingController bodyTextEditingController= TextEditingController();
    return NoteWidget(titleTextEditingController: titleTextEditingController, note: Note(id:id,title:"Title",body:"Body"), bodyTextEditingController: bodyTextEditingController);
  }
}
