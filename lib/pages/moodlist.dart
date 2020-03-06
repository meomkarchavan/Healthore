import 'package:flutter/material.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/pages/moodtile.dart';
import 'package:provider/provider.dart';


class MoodList extends StatefulWidget {
  @override
  _MoodListState createState() => _MoodListState();
}

class _MoodListState extends State<MoodList> {
  @override
  Widget build(BuildContext context) {
    final moodList = Provider.of<List<Mood>>(context) ?? [];


    return Container(
      child: ListView.builder(
        itemCount: moodList.length,
        itemBuilder: (context, index) {
          return MoodTile(mood: moodList[index]);
        },
      ),
    );
  }
}
