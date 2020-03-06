import 'package:flutter/material.dart';
import 'package:heatlhore/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget
    return Authenticate();
    
  }
}