import 'package:fhouse/screens/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainActivity(),
    ));

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
