import 'package:heatlhore/models/mood.dart';

class User {
  final String uid;
  User({this.uid});
}

class UserData {
final String uid;
final List<Mood> moodList;
  UserData({this.moodList,this.uid});
   UserData.fromJson(Map<String, dynamic> json)
      : moodList = json['moodList'],
      uid=json['uid'];

  Map<String, List<Mood>> toJson() =>
    {'moodLIst':moodList,
    };
}
