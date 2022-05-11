
import 'package:project1_v1/Models/DeliveryModel.dart';
import 'package:project1_v1/Models/ItemModel.dart';
import 'package:project1_v1/Models/PharmacyModel.dart';
import 'package:project1_v1/Models/UserModel.dart';
class Database {

  static List<User> users = [
    new User("3bood2003li@gmail.com", UserType.PHARMACY),
  ];

  static List<Pharmacy> pharmacies = [
    new Pharmacy('Orange', 'image/pharmacy1.jpeg',[
      new Item('image/item1.jpeg'),
      new Item('image/item2.jpeg'),
      new Item('image/item3.jpeg'),
      new Item('image/item4.jpeg'),
    ]),
    new Pharmacy('Aster Orange', 'image/pharmacy2.jpeg',[
      new Item('image/item5.jpeg'),
      new Item('image/item6.jpeg'),
      new Item('image/item7.jpeg'),
      new Item('image/item8.jpeg'),
    ]),
    new Pharmacy('Rawhi', 'image/pharmacy3.jpeg',[
      new Item('image/item9.jpeg'),
      new Item('image/item10.jpeg'),
      new Item('image/item11.jpeg'),
      new Item('image/item12.jpeg'),
    ]),
    new Pharmacy('Dar Al-Dawa', 'image/pharmacy4.jpeg',[
      new Item('image/item1.jpeg'),
      new Item('image/item2.jpeg'),
      new Item('image/item3.jpeg'),
      new Item('image/item4.jpeg'),
    ]),
    new Pharmacy('Dawa', 'image/pharmacy5.jpeg',[
      new Item('image/item5.jpeg'),
      new Item('image/item6.jpeg'),
      new Item('image/item7.jpeg'),
      new Item('image/item8.jpeg'),
    ]),
    new Pharmacy('Dawacom', 'image/pharmacy6.jpeg',[
      new Item('image/item9.jpeg'),
      new Item('image/item10.jpeg'),
      new Item('image/item11.jpeg'),
      new Item('image/item12.jpeg'),
    ]),new Pharmacy('Bali', 'image/pharmacy7.jpeg',[
      new Item('image/item1.jpeg'),
      new Item('image/item2.jpeg'),
      new Item('image/item3.jpeg'),
      new Item('image/item4.jpeg'),
    ]),
    new Pharmacy('Sama AlBayader', 'image/pharmacy8.jpeg',[
      new Item('image/item5.jpeg'),
      new Item('image/item6.jpeg'),
      new Item('image/item7.jpeg'),
      new Item('image/item8.jpeg'),
    ]),
    new Pharmacy('Alhayat', 'image/pharmacy9.jpeg',[
      new Item('image/item9.jpeg'),
      new Item('image/item10.jpeg'),
      new Item('image/item11.jpeg'),
      new Item('image/item12.jpeg'),
    ]),
  ];

  static List<Delivery> deliveries =[
    new Delivery("Ahmad"),
    new Delivery("Mohammad"),
    new Delivery("Alaa"),
    new Delivery("Khalid"),
    new Delivery("AbdAlrhman"),
  ];
}