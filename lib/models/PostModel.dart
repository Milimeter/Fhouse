
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//this is a model class for post,each instace will contain list of image of a post(house)
//

class PostModel{
  List<AssetImage> houseimage;
  int price;
  String location;
  String state;
  String description;
  String type;
  PostModel(List<AssetImage> housephoto, int price,String location,String state,String disc,String type){
    this.houseimage=housephoto;
   this.price=price;
   this.location=location;
   this.state=state;
   this.description=disc;
   this.type=type;
  }
}