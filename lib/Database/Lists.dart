import 'package:project1_v1/Models/DriverModel.dart';
import 'package:project1_v1/Models/ItemModel.dart';
import 'package:project1_v1/Models/Order.dart';
import 'package:project1_v1/Models/PharmacyModel.dart';
import 'package:project1_v1/Models/UserModel.dart';

class Database {

  static List<User> users = [
    new User("admin@gmail.com", "" ,"" ,"",UserType.ADMIN),
    new User("pharmacy@gmail.com", "Orange" ,"0781234567" ,"amman (khalda)", UserType.PHARMACY),
    new User("pharmacy1@gmail.com", "Aster Orange" ,"0781231231" ,"irbid (Hussun)", UserType.PHARMACY),
    new User("pharmacy2@gmail.com", "rawhi" ,"0781212121" ,"zarqa (Aljadedeh)", UserType.PHARMACY),
    new User("delivery@gmail.com", "Ahmad" ,"0781111111" ,"", UserType.DELIVERY),
    new User("adnan@gmail.com", "Adnan" ,"0782222222" ,"amman (Arjan)", UserType.CUSTOMER),
    new User("khalid@gmail.com", "Khalid" ,"0783333333" ,"amman (sahab)", UserType.CUSTOMER),
    new User("issa@gmail.com", "Issa" ,"0784444444" ,"amman (dabouq)", UserType.CUSTOMER),
  ];

  static List<Pharmacy> pharmacies = [
    new Pharmacy('Orange', 'image/pharmacy1.jpeg', []),
    new Pharmacy('Aster Orange', 'image/pharmacy2.jpeg', []),
    new Pharmacy('Rawhi', 'image/pharmacy3.jpeg', []),
    new Pharmacy('Dar Al-Dawa', 'image/pharmacy4.jpeg', []),
    new Pharmacy('Dawa', 'image/pharmacy5.jpeg', []),
    new Pharmacy('Dawacom', 'image/pharmacy6.jpeg', []),
    new Pharmacy('Bali', 'image/pharmacy7.jpeg', []),
    new Pharmacy('Sama AlBayader', 'image/pharmacy8.jpeg', []),
    new Pharmacy('Alhayat', 'image/pharmacy9.jpeg', []),
  ];

  static List<Driver> drivers = [
    new Driver("Ahmad"),
    new Driver("Mohammad"),
    new Driver("Alaa"),
    new Driver("Khalid"),
    new Driver("AbdAlrhman"),
  ];
  
  static List<Item> items = [
    new Item('image/item1.jpeg' , "mucosolvan" , 3.5),
    new Item('image/item2.jpeg' , "baby joy" , 5.15),
    new Item('image/item3.jpeg' , "prospan" , 2.00),
    new Item('image/item4.jpeg' , "vichy" , 3.45),
    new Item('image/item5.jpeg' , "bepanthen" , 1.25),
    new Item('image/item6.jpeg' , "panadol" , 3.75),
    new Item('image/item7.jpeg' , "Nido" , 6.35),
    new Item('image/item8.jpeg' , "Amoclan" , 1.5),
    new Item('image/item9.jpeg' , "Allerfin" , 2.2),
    new Item('image/item10.jpeg' , "Olly" , 4.2),
    new Item('image/item11.jpeg' , "puori" , 3.15),
    new Item('image/item12.jpeg' , "c-1000" , 1.85),
  ]
;
  static List<Order> orders = [
    new Order(users.elementAt(5), users.elementAt(1), [items.first]),
    new Order(users.elementAt(6), users.elementAt(2), [items.last]),
    new Order(users.elementAt(7), users.elementAt(3), [items.elementAt(3) ,items.elementAt(5)]),
  ];

}
