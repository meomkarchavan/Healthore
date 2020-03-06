import 'package:flutter/material.dart';
import 'package:heatlhore/models/user.dart';
import 'package:heatlhore/pages/homePage.dart';
import 'package:heatlhore/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomePage(title: "Healthore",);
    }
  }
}
