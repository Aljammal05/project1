import 'package:project1_v1/Models/ItemModel.dart';

class Pharmacy{
  String name ="";
  String imagePath="";
  List<Item> items =[];
  Pharmacy(String name , String imagePath , List<Item> items){
    this.name = name ;
    this.imagePath = imagePath;
    this.items = items;
  }
}