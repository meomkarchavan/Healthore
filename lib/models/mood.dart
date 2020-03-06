class Mood{
final String mood;
final String dateT;
  Mood({this.mood, this.dateT});
  Mood.fromJson(Map<String, dynamic> json)
      : mood = json['mood'],
        dateT = json['dateT'];

  Map<String, dynamic> toJson() =>
    {
      'mood': mood,
      'dateT': dateT,
    };
}
