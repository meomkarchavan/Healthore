import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

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
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 220,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data[position]['text'],
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "~" + snapshot.data[position]['author'],
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  // },
                  )
              : Center(child: CircularProgressIndicator());
        });
  }
}

Future<List<dynamic>> _getQuote() async {
  final res = await http.get('https://type.fit/api/quotes');

  return json.decode(res.body);
}
