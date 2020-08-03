import 'package:fhouse/screens/HomePage.dart';
import 'package:fhouse/screens/Intro.dart';
import 'package:fhouse/screens/Loading.dart';
import 'package:fhouse/screens/Login.dart';
import 'package:flutter/material.dart';

//this is the main class it contains the widget to be routed
void main() => runApp(MaterialApp(
  initialRoute: "startup",
  routes: {
    "startup":(context)=>Loading(),
    "Login":(context)=>Login(),
    "Intro":(context)=>Intro(),
    "Homepage":(context)=>HomePage(),
  },
    ));

