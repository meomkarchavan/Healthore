import 'package:flutter/material.dart';
import 'package:heatlhore/pages/moodlist.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: MoodList()),
    );
  }
}