import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//This is a splash Screen widget

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    //Route to a new page after six seconds
    Future.delayed(Duration(seconds: 6),(){
Navigator.pushReplacementNamed(context, "Login");
});
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.redAccent[100],
                Colors.red
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: Center(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Animator(
                  curve: Curves.linear,
                  cycles: 1,
                  duration: Duration(seconds: 2),
                  builder: (context,anim,child)=>Opacity(
                    opacity: anim.value,
                    child: Icon(
                      Icons.favorite,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                ColorizeAnimatedTextKit(
                  totalRepeatCount: 2,
                  text: [
                    "F-HOUSE"
                  ],
                  textStyle: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Horizon'
                  ),
                  colors:[
                    Hexcolor('#FFFFFF'),
                    Colors.white,
                    Colors.red,
                    Colors.lightGreenAccent
                  ],
                  textAlign: TextAlign.start,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}



