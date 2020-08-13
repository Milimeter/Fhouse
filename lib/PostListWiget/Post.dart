import 'package:carousel_slider/carousel_slider.dart';
import 'package:fhouse/models/PostModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//this is a class responsible for making a widget for each of the post.
//it accept a postmodel instance from the constructor then make a widget for it

class Posts extends StatefulWidget {
  PostModel posts;
  
  Posts({this.posts});
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 350.0,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                highlightColor: Colors.white12,
                onPressed: (){
                  Navigator.push(context, createRoute());
                },
                child: Column(
                  children: <Widget>[

                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: widget.posts.houseimage[2],
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Chip(
                        shadowColor: Colors.redAccent,
                        elevation: 20.0,
                        avatar: CircleAvatar(
                          child: Icon(
                              Icons.home
                          ),
                        ),
                        label:  Text(
                          widget.posts.type,
                          style: TextStyle(
                              fontFamily: "Horizon",
                              color: Colors.lightBlue,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                highlightColor: Colors.white12,
                onPressed: (){
                  Navigator.push(context, createRoute());
                },
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: widget.posts.houseimage[0],
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Chip(
                        shadowColor: Colors.redAccent,
                        elevation: 20.0,
                        avatar: CircleAvatar(
                          child: Icon(
                              Icons.home
                          ),
                        ),
                        label:  Text(
                          widget.posts.type,
                          style: TextStyle(
                              fontFamily: "Horizon",
                              color: Colors.lightBlue,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //navigate to view house
  Route createRoute(){
    return PageRouteBuilder(
        pageBuilder: (context,animation,secanim)=>RoutePage(post: widget.posts),
        transitionsBuilder: (context,animation,secanim,child){
          var curve=Curves.easeOut;
          var begin=Offset(1.0,0.0);
          var end =Offset.zero;
          var tween=Tween(begin: begin,end: end);
          var curvedAnimation=CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        }
    );
  }
}
class RoutePage extends StatefulWidget {
  PostModel post;
  RoutePage({this.post});
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context,b){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.red,
              expandedHeight: 270,
              floating: false,
              pinned: true,
              title: Text("FHOUSE",style: TextStyle(fontSize: 30,fontFamily: "Horizon",color: Colors.white70),),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: CarouselSlider.builder(
                  itemCount: widget.post.houseimage.length,
                  itemBuilder: (context,index)=>
                      Container(
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                          )
                        ),
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: widget.post.houseimage[index],
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                  options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      initialPage: 1,
                      autoPlayInterval: Duration(milliseconds: 2000),
                  ),
                ),
              ),
            )
          ];
        },
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: Container(

                  child: Text(
                    widget.post.description,
                    style: TextStyle(
                      letterSpacing: 4.0,
                      fontSize: 20.0,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Chip(
                  shadowColor: Colors.redAccent,
                  elevation: 20.0,
                  avatar: CircleAvatar(
                    child: Icon(
                        Icons.home
                    ),
                  ),
                  label:  Text(
                    widget.post.type,
                    style: TextStyle(
                        fontFamily: "Horizon",
                        color: Colors.lightBlue,
                        fontSize: 15
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                     child: Chip(
                       avatar: CircleAvatar(
                         child: Icon(
                           Icons.monetization_on
                         ),
                       ),
                       label: Text(
                         "State:${widget.post.price}",
                         style: TextStyle(
                             fontFamily: "Horizon",
                             color: Colors.green,
                             fontSize: 10
                         ),
                       ),
                     ),
                    ),
                    Expanded(
                      child: Chip(
                        avatar: CircleAvatar(
                          child: Icon(
                              Icons.location_on
                          ),
                        ),
                        label: Text(
                          "Location:${widget.post.location}",
                          style: TextStyle(
                              fontFamily: "Horizon",
                              color: Colors.green,
                              fontSize: 10
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Chip(
                        avatar: CircleAvatar(
                          child: Icon(
                              Icons.stars
                          ),
                        ),
                        label:  Text(
                          "Status:${widget.post.state}",
                          style: TextStyle(
                              fontFamily: "Horizon",
                              color: Colors.green,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                highlightColor: Colors.lightBlue,
                onPressed: (){

                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                color: Colors.blueAccent,
                child: Text(
                  "Book now",
                  style: TextStyle(
                    fontFamily: "Horizon",
                    fontSize: 30.0,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

