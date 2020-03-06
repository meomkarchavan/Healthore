import 'package:flutter/material.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/pages/moodlist.dart';
import 'package:heatlhore/services/auth.dart';
import 'package:heatlhore/services/database.dart';
import 'package:provider/provider.dart';


class Home1 extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Mood>>.value(
      value: DatabaseService().moods,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Healthore'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.people),
              label: Text('Log Out'),
            ),
          ],
        ),
        body: Container(
          
          child: MoodList(),
        ),
      ),
    );
  }
}
