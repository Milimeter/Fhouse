import 'package:fhouse/Form%20Decoration/formdecoration.dart';
import 'package:fhouse/screens/Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Key _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.redAccent[100],
                  Colors.red
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            height: 700,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "FUOYE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Horizon",
                                    fontSize: 40
                                ),
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Horizon"
                                ),
                              ),
                              Text(
                                "HOUSE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Horizon",
                                    fontSize: 50
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Book for your hostels in fuoye",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Dancing Script",
                                fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: Form(
                      key: _key,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: textInputDecoration.copyWith(icon: Icon(Icons.email,color: Colors.white,),hintText: "Email",hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(icon: Icon(Icons.lock,color: Colors.white,),hintText: "Password",hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(height: 30,),
                          FlatButton(
                            highlightColor: Colors.white70,
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, "Intro");
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white70,width: 0.5),
                            ),
                            color: Colors.white,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height:100,
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Dont have an account",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Dancing Script",
                              fontSize: 20.0
                            ),
                          ),
                          FlatButton(
                            color: Colors.red[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white,width: 0.5)
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                            },
                            highlightColor: Colors.white70,
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily:"Horizon",
                                  fontSize: 20,
                                ),
                              )
                          ),
                        ],
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white,width: 0.5),
                        ),
                        onPressed: (){},
                          highlightColor: Colors.white70,
                          child: Text(
                            "Forgot password",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily:"Dancing Script",
                              fontSize: 30,
                            ),
                          )
                      )
                    ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

