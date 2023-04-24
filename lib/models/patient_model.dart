import 'dart:js_util';

class PatientModel{
  String ? message;
  List<PatientDataModel> date = [];

  PatientModel.fromJson(Map<String , dynamic> json){
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((element){
        date.add(element);
      });
    }
  }
}
class PatientDataModel{
  int ? id;
  String ? patientStatus;
  String ? firstName;
  String ? lastName;
  String ? email;
  String ? password;
  String ? address;
  int ? gender;
  String ? dateOfBirth;
  int ? weight;
  int ? height;
  String ? refreshTokenValue;
  String ? photo;
  String ? symptoms;
  String ? phone;

  PatientDataModel.fromJson(Map<String , dynamic> json){
    id = json['ID'];
    patientStatus = json['Patient_Status'];
    firstName = json['F_Name'];
    lastName = json['L_Name'];
    email = json['Email'];
    password = json['Pass'];
    address = json['Address'];
    gender = json['Gender'];
    dateOfBirth = json['DOB'];
    weight = json['Weight'];
    height = json['Height'];
    refreshTokenValue = json['Refresh_Token_Value'];
    photo = json['Photo'];
    symptoms = json['Symptoms'];
    phone = json['Phone'];
  }
}