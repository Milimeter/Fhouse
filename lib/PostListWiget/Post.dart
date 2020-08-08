import 'package:fhouse/models/PostModel.dart';
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
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        widget.posts.description
                      ),
                    ),
                  ),
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
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: <Widget>[
                             Icon(
                               Icons.monetization_on,color: Colors.green,
                             ),
                             Text(
                               "Price: ${widget.posts.price}",
                               style: TextStyle(
                                   fontFamily: "Horizon",
                                   color: Colors.red,
                                   fontSize: 5
                               ),
                             ),
                           ],
                         ),
                       ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,color: Colors.red,
                              ),
                              Text(
                                "Location: ${widget.posts.location}",
                                style: TextStyle(
                                    fontFamily: "Dancing Script",
                                    color: Colors.red,
                                    fontSize: 5
                                ),
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.event_available,color: Colors.blue,
                              ),
                              Text(
                                "Status: ${widget.posts.state}",
                                style: TextStyle(
                                    fontFamily: "Dancing Script",
                                    color: Colors.red,
                                    fontSize: 5
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                          widget.posts.description
                      ),
                    ),
                  ),
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
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.monetization_on,color: Colors.green,
                              ),
                              Text(
                                "Price: ${widget.posts.price}",
                                style: TextStyle(
                                    fontFamily: "Horizon",
                                    color: Colors.red,
                                    fontSize: 5
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,color: Colors.red,
                              ),
                              Text(
                                "Location: ${widget.posts.location}",
                                style: TextStyle(
                                    fontFamily: "Dancing Script",
                                    color: Colors.red,
                                    fontSize: 5
                                ),
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.event_available,color: Colors.blue,
                              ),
                              Text(
                                "Status: ${widget.posts.state}",
                                style: TextStyle(
                                    fontFamily: "Dancing Script",
                                    color: Colors.red,
                                    fontSize: 5
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
          var begin=Offset(0.0,1.0);
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
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image(
                  image: widget.post.houseimage[1],
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: Center(

        ),
      ),
    );
  }
}

