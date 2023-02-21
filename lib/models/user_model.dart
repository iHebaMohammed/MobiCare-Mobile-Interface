import 'dart:math';

class UserModel{

  late String ? firstName;
  late String ? lastName;
  late String ? email;
  late String ? uId;
  late String ? imageUrl;
  late String ? address;
  late String ? phoneNumber;
  late bool ? isMale;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
    this.imageUrl,
    this.uId,
    this.isMale
  });

  UserModel.fromJson(Map<String , dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    uId = json['uId'];
    isMale = json['isMale'];
  }

  Map<String , dynamic> toMap(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'address':address,
      'phoneNumber':phoneNumber,
      'imageUrl':imageUrl,
      'uId':uId,
      'isMale':isMale,
    };
  }
}