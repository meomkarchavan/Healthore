import 'package:flutter/material.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/models/user.dart';
import 'package:heatlhore/pages/temp.dart';
import 'package:heatlhore/services/auth.dart';
import 'package:heatlhore/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // var  moodList=[Mood(mood:"happy",dateT:DateTime.now().toString()),Mood(mood:"happy",dateT:DateTime.now().toString())];
// var data=UserData(moodList:[Mood(mood:"happy",dateT:DateTime.now().toString()).toJson()],uid:"33");
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {

    // print([Mood(mood:"happy",dateT:DateTime.now().toString()).toJson(),Mood(mood:"happy",dateT:DateTime.now().toString()).toJson(),Mood(mood:"happy",dateT:DateTime.now().toString()).toJson()]);
  //  return Container();
   return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
        home: Home1(),
      ),
    );
  }
}
