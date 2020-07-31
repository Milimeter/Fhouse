import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhouse/models/user.dart';
import 'package:fhouse/utils/username.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<FirebaseUser> getCurrentUser();
  Future<void> addDataToDb(FirebaseUser currentUser, jambReg, password);
  Future<void> signOut();
}

class Auth implements AuthImplementation {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 // static final Firestore _firestore = Firestore.instance;
  static final Firestore firestore = Firestore.instance;

 // static final CollectionReference _userCollection =
   //   _firestore.collection("users");
  // User users = User();

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user; // stackoverflow code for typecast error
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  Future<void> addDataToDb(FirebaseUser currentUser, jambReg, password) async {
    String username = Username.getUsername(currentUser.email);

    User user = User(
      uid: currentUser.uid,
      email: currentUser.email,
      username: username,
      jambReg: jambReg,
      password: password,
    );

    firestore
        .collection("users")
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }
}
