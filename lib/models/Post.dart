

class Post {
  final String message;
  final String userid;
  final String dateTime;
  final List<String> category;
  final List<String> tags;

  Post({this.message, this.userid, this.dateTime, this.category, this.tags});
  Post.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        userid = json['userid'],
        dateTime = json['dateTime'],
        category = json['category'],
        tags = json['tags'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'userid': userid,
        'dateTime': dateTime,
        'category': category,
        'tags': tags
      };
}
