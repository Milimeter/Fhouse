
import 'package:fhouse/PostListWiget/Post.dart';
import 'package:fhouse/models/PostModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //List of asset image for sample
  static List<AssetImage> houseImagetoPosts=[
    AssetImage("assets/bernard-hermant-c4Ccpa8sMlI-unsplash .jpg"),
    AssetImage("assets/flat.jpeg"),
    AssetImage("assets/hoste.jpeg"),
    AssetImage("hostel.jpeg"),
    AssetImage("selfcon.jpeg"),
  ];

  //List of post,each of this posts items contains list of images above
  List<PostModel> posts=[
    PostModel(houseImagetoPosts,20000,"Oye","Available","A selcon,tiled, very spacious is available at oye"),
    PostModel(houseImagetoPosts,50000,"Oye","Booked","A selcon,tiled, very spacious is available at oye"),
    PostModel(houseImagetoPosts,10000,"Oye","Available","A selcon,tiled, very spacious is available at oye"),
    PostModel(houseImagetoPosts,50000,"Oye","Booked","A selcon,tiled, very spacious is available at oye"),
    PostModel(houseImagetoPosts,20000,"Oye","Available","A selcon,tiled, very spacious is available at oye"),
    PostModel(houseImagetoPosts,80000,"Oye","Available","A selcon,tiled, very spacious is available at oye"),
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
