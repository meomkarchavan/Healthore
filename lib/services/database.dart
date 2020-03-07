import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heatlhore/models/Post.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference moodCollection =
      Firestore.instance.collection('mood1');
  final CollectionReference postCollection =
      Firestore.instance.collection('post1');

  Future updatePost(Map<String, dynamic> post) async {
var data={'message': post['message'],
      'userid': post['userid'],
      'dateTime': post['dateTime'],
      'category': post['category'],
      'tags': post['tags']};

    return await postCollection.document(uid).updateData({'Posts': FieldValue.arrayUnion([data])});
  
  }
   Future addPost(Map<String, dynamic> post) async {
var data={'message': post['message'],
      'userid': post['userid'],
      'dateTime': post['dateTime'],
      'category': post['category'],
      'tags': post['tags']};

    return await postCollection.document(uid).setData({'Posts': [data]});
  
  }

  Future updateUserData(List<Map<String, dynamic>> moodList) async {
    return await moodCollection.document(uid).setData({'moodlist': moodList});
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
UserData _postFromSnapshot(DocumentSnapshot snapshot) {
    return snapshot.data['Posts'];
  }
//brew list from snapshot
  List<Mood> _moodListFromSnapshot(QuerySnapshot snapshot) {
    var llist = [];
    snapshot.documents.forEach((doc) {
      for (var i = 0; i < doc.data['moodlist'].length; i++) {
        llist.add(doc.data['moodlist'][i]);
      }
    });
    return llist.map((item) {
      return Mood(mood: item['mood'], dateT: item['dateT']);
    }).toList();
  }
  List<Post> _postListFromSnapshot(QuerySnapshot snapshot) {
    var llist = [];
    snapshot.documents.forEach((doc) {
      print(doc);
    });
    // snapshot.documents.forEach((doc) {
    //   for (var i = 0; i < doc.data['moodlist'].length; i++) {
    //     llist.add(doc.data['moodlist'][i]);
    //   }
    // });
    // return llist.map((item) {
    //   return Mood(mood: item['mood'], dateT: item['dateT']);
    // }).toList();
  }
  //get moods stream
  Stream<List<Mood>> get moods {
    return moodCollection.snapshots().map(_moodListFromSnapshot);
  }
   Stream<List<Post>> get posts {
    return postCollection.snapshots().map(_postListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return moodCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
