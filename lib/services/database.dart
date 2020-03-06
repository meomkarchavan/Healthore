import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('mood');

  Future updateUserData(List<Mood> moodList,String dateT) async {
    return await brewCollection
        .document(uid)
        .setData({'moodlist': moodList,'dateT':dateT});
  }


  //get userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      moodList: snapshot.data['moodList'],
      dateT:snapshot.data['dateT'],
    );
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
