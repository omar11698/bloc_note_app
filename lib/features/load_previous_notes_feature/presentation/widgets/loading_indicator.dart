import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../../core/utils/constants.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //homeViewModel.progressValue instead of 1
 return  Scaffold(
  appBar: AppBar(
    backgroundColor: appBarColor,
    title: const Text("My Notes"),
  ),
   body: Center(
     child: SizedBox(
       height: 200,
       width: 200,
       child: LoadingIndicator(
           indicatorType: Indicator.pacman, /// Required, The loading type of the widget
           colors:  [ivoryAccentColor,floatingActionButtonColor],       /// Optional, The color collections
           strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
           // backgroundColor: Colors.white,      /// Optional, Background of the widget
           pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
       ),
     ),
   ),
 );

  }
}
