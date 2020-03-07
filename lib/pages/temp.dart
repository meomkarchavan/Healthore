// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:heatlhore/services/audioPlayer.dart';
import 'package:heatlhore/services/quotes.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ];
  static final List<Map<String,dynamic>> data=

[{"message": "why they say I'm ready for commitment when we propose they don't accept even one?", "username": "Kenzo Tv"},
{"message": "For men may come and men may go But I go on forever", "username": "The Brook"},
{"message": "You are a mirror. If you continue to starve yourself of love, you'll only meet people who will starve you too. If you soak yourself in love, the universe will and you those who'll love you too.", "username": "Rupi Kaur"},
{"message": "It's to start caring about what you think. It's to make your opinion of you, - more important than anyone else's. 😘", "username": "Beth"},
{"message": "It’s Friday and I’ve been off all day and I have done nothing. Having accomplished anything. Now it’s Friday night and still nothing to do no one to spend any time with. I have a complicated relationship with this guy I’ve been dating for a month and he was suppose to take me out tonight but idk forgot he had plans with me and decided to go party in a club instead. Ive been trying to deal with the rejection all day. But seems like I just can’t stop crying. ", "username": "Anonymous"},
{"message": "hello, I want to ask if anyone here has ever felt the yearning for memories but not with the person?", "username": "Anonymous"},
{"message": "Pain shapes a woman into warrior 🦋", "username": "Kelly"},
{"message": "i just got accepted to my dream school with a \$25,000 scholarship!!!!!!  im so happy that my hard work in school is finally giving me tangible results 😁😁😁😁", "username": "Newbie"},
{"message": "Can I just kill my self before someone else does", "username": "Ankit"},
{"message": "Be unique and be yourself and work on getting better", "username": "Joey"}];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;
  Future<String> _getQuote() async {
    final res = await http.get('https://type.fit/api/quotes');
    return json.decode(res.body)[3]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Quote of the Day',
                          style: TextStyle(color: Colors.blueAccent)),
                      FutureBuilder(
                          future: _getQuote(),
                          builder: (context, snapshot) {
                            return snapshot.connectionState ==
                                    ConnectionState.done
                                ? FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      snapshot.data,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                ]),
          ),
        ),
        _buildTile(
          InkWell(
            onTap:(){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => QuoteList()),
  );
            } ,
                      child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        color: Colors.cyan,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.text_format,
                              color: Colors.white, size: 40.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Quotes',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('Images, Videos',
                        style: TextStyle(color: Colors.white54)),
                  ]),
            ),
          ),
        ),
        _buildTile(
          InkWell(onTap:(){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LocalAudio()),
  );
            } ,
           
                      child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.insert_emoticon,
                              color: Colors.white, size: 40.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Relax',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('All ', style: TextStyle(color: Colors.white54)),
                  ]),
            ),
          ),
        ),
        _buildTile(
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Mood', style: TextStyle(color: Colors.green)),
                          Text('Happy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0)),
                        ],
                      ),
                      DropdownButton(
                          isDense: true,
                          value: actualDropdown,
                          onChanged: (String value) => setState(() {
                                actualDropdown = value;
                                actualChart = chartDropdownItems
                                    .indexOf(value); // Refresh the chart
                              }),
                          items: chartDropdownItems.map((String title) {
                            return DropdownMenuItem(
                              value: title,
                              child: Text(title,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0)),
                            );
                          }).toList())
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  Sparkline(
                    data: charts[actualChart],
                    lineWidth: 5.0,
                    lineColor: Colors.greenAccent,
                  )
                ],
              )),
        ),
        
        
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(2, 220.0),
        StaggeredTile.extent(2, 110.0),
      ],
    ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
