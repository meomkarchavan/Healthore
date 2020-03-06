import 'package:heatlhore/models/mood.dart';

class User {
  final String uid;
  User({this.uid});
}

class UserData {
final String uid;
final List<Mood> moodList;
final String dateT;
  UserData({this.moodList,this.uid,this.dateT});
}
