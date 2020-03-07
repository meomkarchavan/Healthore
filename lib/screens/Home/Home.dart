import 'package:flutter/material.dart';
import 'package:heatlhore/models/Post.dart';
import 'package:heatlhore/pages/moodlist.dart';
import 'package:heatlhore/screens/Home/postList.dart';
import 'package:heatlhore/services/audioPlayer.dart';
import 'package:heatlhore/services/quotes.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(child: QuoteList()),
        // Expanded(child: MoodList(),)
        // Expanded(child: LocalAudio())
      ],
    );
  }
}