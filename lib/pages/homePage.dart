import 'package:flutter/material.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/screens/Home/Home.dart';
import 'package:heatlhore/screens/Home/Profile.dart';
import 'package:heatlhore/screens/Home/addPost.dart';
import 'package:heatlhore/services/auth.dart';
import 'package:heatlhore/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
 List<Widget> _widgetOptions = <Widget>[
  Home(),
  AddPost(),
  Profile()
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {

      final AuthService _auth = AuthService();

    return StreamProvider<List<Mood>>.value(
      value:DatabaseService().moods,
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(widget.title),
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
        body: SafeArea(child: _widgetOptions[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      ),
    );
  }
}

