import 'package:firebase_auth/firebase_auth.dart';
import 'package:heatlhore/models/mood.dart';
import 'package:heatlhore/models/user.dart';
import 'package:heatlhore/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object based on firebaseUser
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }

  //sign in anom
  Future signInAnom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFireBaseUser(user);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  //sign in with email and pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //       var mood=Mood(dateT: DateTime.now().toString(),mood: "pata nhi").toJson();
      // var mood2=Mood(dateT: DateTime.now().toString(),mood: "idk").toJson();

      // var moodList=[mood,mood2];

      //       await DatabaseService(uid: user.uid)
      //     .appendUserData(moodList);

      return _userFromFireBaseUser(user);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  //register with email and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      var mood=Mood(dateT: DateTime.now().toString(),mood: "happy").toJson();
      var mood2=Mood(dateT: DateTime.now().toString(),mood: "sad").toJson();

      var moodList=[mood,mood2];
      // print(moodList);
      // print(DateTime.now());
      await DatabaseService(uid: user.uid)
          .updateUserData(moodList);
      // await DatabaseService(uid: user.uid)
      //     .appendUserData(moodList);
      
      return _userFromFireBaseUser(user);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  //sign  out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
