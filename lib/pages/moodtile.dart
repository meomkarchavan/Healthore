import 'package:flutter/material.dart';
import 'package:heatlhore/models/mood.dart';

class MoodTile extends StatelessWidget {
  final Mood mood;
  MoodTile({this.mood});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading:Text(mood.mood),
          title: Text(mood.dateT),
        ),
      ),
    );
  }
}
