import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference moodCollection =
      Firestore.instance.collection('mood1');

  Future updateUserData(List<Map<String, dynamic>> moodList) async {
    // print(moodList);
    return await moodCollection
        .document(uid)
        .setData({'moodlist': FieldValue.arrayUnion(moodList)});
  }

  Future appendUserData(List<Map<String, dynamic>> moodList) async {
    return await moodCollection
        .document(uid)
        .updateData({'moodlist': FieldValue.arrayUnion(moodList)});
  }

  //get userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      moodList: snapshot.data['moodList'],
    );
  }

//brew list from snapshot
  List<Mood> _moodListFromSnapshot(QuerySnapshot snapshot) {
    var llist = [];
    snapshot.documents.forEach((doc) {
      for (var i = 0; i < doc.data['moodlist'].length; i++) {
        llist.add(doc.data['moodlist'][i]);
      }

    });
        return llist.map((item){
        return Mood(mood: item['mood'],dateT: item['dateT']);
        }).toList();

  }

  //get moods stream
  Stream<List<Mood>> get moods {
    return moodCollection.snapshots().map(_moodListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return moodCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
