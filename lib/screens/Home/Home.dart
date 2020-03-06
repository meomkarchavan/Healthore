import 'package:flutter/material.dart';
import 'package:heatlhore/services/quotes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(child: QuoteList())
      ],
    );
  }
}