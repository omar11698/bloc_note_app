import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../show_note_from_homepage_feature/presentation/pages/note_clicked_page.dart';
import '../../domain/entities/note_entity.dart';


class NoteCardWidget extends StatelessWidget {

  final  String  title,body;
  final int id;

  const NoteCardWidget({Key? key, required this.title, required this.body, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      /// the click on note should navigate your to another screen with the note content
      onTap: (){

           Navigator.push(context, MaterialPageRoute(builder: (_)=> NoteClickedPage(note:Note(id:  id , title:  title, body:  body))));

      },


      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:  BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(8)),color:ivoryAccentColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                // Consumer<HomeViewModel>(
                //   builder: (context, homeViewModel, child) {
                //     return Text('Total price: ${homeViewModel.notes![id].title}');
                //   },  ),
                    Text(title),

                // Consumer<HomeViewModel>(
                //   builder: (context, homeViewModel, child) {
                //     return Text('Total price: ${homeViewModel.notes![id].body}');
                //   },
                // ),
                Text(body),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
