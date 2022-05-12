import 'package:project1_v1/Models/ItemModel.dart';
import 'package:project1_v1/Models/UserModel.dart';

class Order{

  User? customer ;
  User? pharmacy ;
  List<Item> items =[];

  Order(User customer , User pharmacy , List<Item> items ){
    this.customer = customer ;
    this.pharmacy = pharmacy ;
    this.items = items ;
  }

  double calculateTotal(){
    double sum = 0;
    items.forEach((item) {sum += item.price;});
    return sum;
  }

}