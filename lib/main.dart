import 'package:flutter/material.dart';
import 'package:heatlhore/services/auth.dart';
import 'package:heatlhore/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
      theme: ThemeData(
            brightness: Brightness.dark,
    primaryColor: Colors.cyan,
        accentColor: Colors.cyan[600],


        primarySwatch: Colors.cyan,
      ),
        home: Wrapper(),
      ),
    );
  }
}
