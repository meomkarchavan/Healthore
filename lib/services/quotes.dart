import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuoteList extends StatelessWidget {
  const QuoteList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getQuote(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text(snapshot.data[position]['text']));
                  },
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}

Future<List<dynamic>> _getQuote() async {
  final res = await http.get('https://type.fit/api/quotes');

  return json.decode(res.body);
}
