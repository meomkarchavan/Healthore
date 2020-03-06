import 'package:flutter/material.dart';
import 'package:heatlhore/screens/Home.dart';
import 'package:heatlhore/screens/Profile.dart';
import 'package:heatlhore/screens/addPost.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Healthore'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _widgetOptions[_selectedIndex],
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
    );
  }
}

