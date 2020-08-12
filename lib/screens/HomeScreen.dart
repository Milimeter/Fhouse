
import 'package:fhouse/PostListWiget/Post.dart';
import 'package:fhouse/models/PostModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //List of asset image for sample
  static List<AssetImage> houseImagetoPosts=[
    AssetImage("assets/selfcon.jpeg"),
    AssetImage("assets/flat.jpeg"),
    AssetImage("assets/hoste.jpeg"),
  ];

  //List of post,each of this posts items contains list of images above
  List<PostModel> posts=[
    PostModel(houseImagetoPosts,20000,"Oye","Available","A selcon,tiled, very spacious is available at oye,location ikole ekity oye,very spacious can contain two or more people together click the blue button bellow to get the house","SELFCON"),
    PostModel(houseImagetoPosts,50000,"Oye","Booked","A selcon,tiled, very spacious is available at oye,location ikole ekity oye,very spacious can contain two or more people together click the blue button bellow to get the house","FLAT"),
    PostModel(houseImagetoPosts,10000,"Oye","Available","A selcon,tiled, very spacious is available at oye,location ikole ekity oye,very spacious can contain two or more people together click the blue button bellow to get the house","FLAT"),
    PostModel(houseImagetoPosts,50000,"Oye","Booked","A selcon,tiled, very spacious is available at oye,location ikole ekity oye,very spacious can contain two or more people together click the blue button bellow to get the house","SELFCON"),
    PostModel(houseImagetoPosts,20000,"Oye","Available","A selcon,tiled, very spacious is available at oye,location ikole ekity oye,very spacious can contain two or more people together click the blue button bellow to get the house","SINGLE ROOM"),
    PostModel(houseImagetoPosts,80000,"Oye","Available","A selcon,tiled, very spacious is available at oye,location ikole ekity oye,very spacious can contain two or more people together click the blue button bellow to get the house","SINGLE ROOM"),
  ];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //List view for the post,it passes the List<PostModel> posts items to the post widget class to make the widget for
    //each ite
    return Container(
      child: ListView.builder(
        itemCount: widget.posts.length,
          itemBuilder: (context,index)=>
              Posts(posts : widget.posts[index]),
      ),
    );
  }
}
