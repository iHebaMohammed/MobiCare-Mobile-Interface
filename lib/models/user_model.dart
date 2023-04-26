import 'dart:math';

class UserModel{

  late String firstName;
  late String lastName;
  late String email;
  late String uId;
  late String imageUrl;
  late String address;
  late String phoneNumber;
  late bool isMale;
  late String role;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.imageUrl,
    required this.uId,
    required this.isMale,
    required this.role,
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
    role = json['role'];
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
      'role':role,
    };
  }
}