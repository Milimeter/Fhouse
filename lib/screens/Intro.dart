import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
class Intro extends StatefulWidget {

  //This is an Intro screen
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Slide> _slides=new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Initiate Slide
    _slides.add(
      new Slide(
        title: "SINGLE ROOM",
        styleTitle: TextStyle(color: Colors.white,fontFamily: "Horizon",fontSize: 25),
        description: "Get affodable single room hostels in Oye and Ikole",
        styleDescription: TextStyle(color: Colors.white,fontFamily: "Dancing Script",fontSize: 25),
        marginDescription: EdgeInsets.all(20.0),
        centerWidget: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage("assets/hostel.jpeg"),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        colorBegin: Colors.red,
        colorEnd: Colors.redAccent,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    _slides.add(
        new Slide(
          title: "SElF CON",
          styleTitle: TextStyle(color: Colors.white,fontFamily: "Horizon",fontSize: 25),
          description: "Get affodable selfcon hostels in Oye and Ikole",
          styleDescription: TextStyle(color: Colors.white,fontFamily: "Dancing Script",fontSize: 25),
          marginDescription: EdgeInsets.all(20.0),
          centerWidget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 270,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("assets/selfcon.jpeg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          colorBegin: Colors.red,
          colorEnd: Colors.redAccent,
          directionColorBegin: Alignment.topCenter,
          directionColorEnd: Alignment.bottomCenter,
        ),
    );
    _slides.add(
      new Slide(
        title: " FLAT",
        styleTitle: TextStyle(color: Colors.white,fontFamily: "Horizon",fontSize: 25),
        description: "Get affodable flat (2 bedroom,3 bedroom,4 bedroom) in Oye and Ikole",
        styleDescription: TextStyle(color: Colors.white,fontFamily: "Dancing Script",fontSize: 25),
        marginDescription: EdgeInsets.all(20.0),
        centerWidget:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 270,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage("assets/flat.jpeg"),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
        colorBegin: Colors.red,
        colorEnd: Colors.redAccent,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
  }
void onDonePress(){
    Navigator.pushReplacementNamed(context, "Homepage");
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroSlider(
        slides: this._slides,
        onDonePress: (){
          Navigator.pushReplacementNamed(context, "Homepage");
        },
        renderSkipBtn: skipButton(),
        renderNextBtn: nextButton(),
        renderDoneBtn: doneBtn(),
        renderPrevBtn: prevBtn(),
        highlightColorDoneBtn: Colors.white70,
        highlightColorPrevBtn: Colors.white70,
        highlightColorSkipBtn: Colors.white70,
        colorDot: Colors.white,
        colorActiveDot: Colors.green,
        sizeDot: 6.0,
        shouldHideStatusBar: true,
      ),
    );
  }
  Widget nextButton(){
    return Icon(
      Icons.skip_next,
      size: 20.0,
      color: Colors.white,
    );
  }
  Widget prevBtn(){
    return Icon(
      Icons.navigate_before,
      size: 20.0,
      color: Colors.white,
    );
  }
  Widget skipButton(){
    return Icon(
      Icons.navigate_next,
      size: 20.0,
      color: Colors.white,
    );
  }
  Widget doneBtn(){
    return Icon(
      Icons.done,
      size: 20.0,
      color: Colors.white,
    );
  }
}
