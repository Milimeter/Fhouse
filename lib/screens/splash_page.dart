import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhouse/screens/homepage.dart';
import 'package:fhouse/screens/login_page.dart';
import 'package:fhouse/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
              if (currentUser == null)
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                }
              else
                {
                  Firestore.instance
                      .collection("users")
                      .document(currentUser.uid)
                      .get()
                      .then((DocumentSnapshot result) =>
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage())))
                      .catchError((err) => print(err))
                }
            })
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.barColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Loading Current User Session",
                style: TextStyle(
                  color: UniversalVariables.mainColor,
                  fontSize: MediaQuery.of(context).size.height / 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "Loading...",
              //   style: TextStyle(
              //     color: UniversalVariables.mainColor,
              //     fontSize: MediaQuery.of(context).size.height / 40,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
