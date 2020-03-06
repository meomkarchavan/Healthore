import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:heatlhore/models/mood.dart';
import 'package:provider/provider.dart';

class MoodChart extends StatelessWidget {
  final List<Mood> data;

  MoodChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Mood, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        // domainFn: (Mood series, _) =>
            // DateTime.parse(series.dateT).toUtc().hour.toString(),
        domainFn: (Mood series, _) => series.dateT,

        // domainFn: (Mood series,_)=> series.mood,
        // measureFn: (Mood series, _) =>DateTime.parse(series.dateT).hour,
        measureFn: (Mood series, _) => series.mood == "happy" ? 5 : 3,
        colorFn: (Mood series, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      )
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moodList = Provider.of<List<Mood>>(context) ?? [];
    return Container(
      child: Column(
        children: <Widget>[
          Text("Profile"),
          MoodChart(
            data: moodList,
          ),
        ],
      ),
    );
  }
}
