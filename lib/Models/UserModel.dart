enum  UserType  {
  ADMIN,
  CUSTOMER,
  DELIVERY,
  PHARMACY,
}

class User{

  String email = "" ;
  String name = "" ;
  String phoneNO = "" ;
  String location = "" ;
  UserType? type ;

  User( String email ,String name ,String phoneNO ,String location ,UserType type ){
    this.email=email;
    this.name=name;
    this.phoneNO=phoneNO;
    this.location=location;
    this.type=type;
  }

}