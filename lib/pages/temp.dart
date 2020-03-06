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
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Brew Crew'),
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: MoodList(),
        ),
      ),
    );
  }
}
