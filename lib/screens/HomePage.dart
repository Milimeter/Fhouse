import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fhouse/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// this class contains the appbar,pageview and botom navigation bar,the page view holds three widget class
// the HomeScreen,the profile and upload which will be added later
 class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          FlatButton.icon(
            highlightColor: Colors.white,
            color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white,width: 0.5),
              ),
              onPressed: (){},
              icon: Icon(
                Icons.people_outline,
                color: Colors.white,
              ),
              label: Text("Sign out")
          )
        ],
        title: Text(
          'Start Bokking',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Horizon",
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: PageView(
        children: <Widget>[
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white10,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.red,
            size: 30,
          ),
          Icon(
            Icons.file_upload,
            color: Colors.red,
            size: 30.0,
          ),
          Icon(
            Icons.people_outline,
            color: Colors.red,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
