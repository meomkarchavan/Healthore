import 'package:flutter/material.dart';
import 'package:heatlhore/pages/temp.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(child: MainPage())
        // Expanded(child: QuoteList()),
        // Expanded(child: MoodList(),)
        // Expanded(child: LocalAudio())
      ],
    );
  }
}