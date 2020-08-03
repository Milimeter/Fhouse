import 'package:fhouse/Form%20Decoration/formdecoration.dart';
import 'package:flutter/material.dart';
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Container(
          height: 800,
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        color:  Colors.white,
                        fontSize: 50,
                        fontFamily: "Horizon",
                      ),
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(icon: Icon(Icons.email,color: Colors.white,),hintText: "Email",hintStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(icon: Icon(Icons.person,color: Colors.white,),hintText: "Full Name",hintStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(icon: Icon(Icons.confirmation_number,color: Colors.white,),hintText: "Reg number",hintStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(icon: Icon(Icons.lock,color: Colors.white,),hintText: "Password",hintStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(icon: Icon(Icons.lock,color: Colors.white,),hintText: "Confirm password",hintStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 25.0),
                    FlatButton(
                      highlightColor: Colors.white70,
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white,width: 0.5),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
