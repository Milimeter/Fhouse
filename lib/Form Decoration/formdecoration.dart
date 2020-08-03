
import 'package:flutter/material.dart';
// This is a global form decoration
 const textInputDecoration=InputDecoration(
    filled: true,
    fillColor: Colors.redAccent,
    focusColor: Colors.blue,
    hoverColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.white70,width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide(color:Colors.white70,width: 1.0)
    ),
  );