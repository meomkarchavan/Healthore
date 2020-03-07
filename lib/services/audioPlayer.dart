import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class LocalAudio extends StatefulWidget {
  @override
  _LocalAudio createState() => _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(1.0),
          child: Row(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return Expanded(
      child: ButtonTheme(
        minWidth: 8.0,
        child: Container(
          width: 50,
          height: 45,
          child: IconButton(
            icon:Icon(txt=="play"?Icons.play_circle_filled:txt=="pause"?Icons.pause_circle_filled:Icons.stop),
          iconSize: 50,
          onPressed: onPressed,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }

  var music = [
    "white.mp3",
    "white1.mp3",
    "white2.mp3",
    "white3.mp3",
    "white4.mp3"
  ];
  var music1 = [
    "white noise 1",
    "white noise 2",
    "white noise 3",
    "white noise 4",
    "white noise 5"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.teal,
            title: Center(child: Text('CALM WHITE AUDIO')),
          ),
          body: ListView.builder(
              itemCount: music.length,
              itemBuilder: (context, index) {
                return Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(music1[index]),
                    _btn('play', () => audioCache.play(music[index])),
                    _btn('pause', () => advancedPlayer.pause()),
                    _btn('stop', () => advancedPlayer.stop()),
                    SizedBox(
                      height: 120.0,
                    )
                  ],
                );
              })),
    );
  }
}

// return Expanded(
//       child: ButtonTheme(
//     minWidth: 8.0,
//     child: Container(
//       width: 50,
//       height: 45,
//       child: RaisedButton(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//           child: Text(txt),
//           color: Colors.lightBlue,
//           textColor: Colors.white,
