import 'package:project1_v1/UserTypePage.dart';
enum  UserType  {
  ADMIN,
  CUSTOMER,
  DELIVERY,
  PHARMACY,
}

class User{
  String email ="";
  UserType? type ;
  User( String email ,UserType type ){
    this.email=email;
    this.type=type;
  }


}