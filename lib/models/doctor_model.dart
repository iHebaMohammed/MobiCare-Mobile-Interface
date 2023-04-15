class DoctorModel {
  String ? message;
  List<DoctorDataModel> date = [];

  DoctorModel.fromJson(Map<String , dynamic> json){
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((element){
        date.add(element);
      });
    }
  }
}

class DoctorDataModel{
  int ? id;
  String ? doctorStatus;
  int ? adminId;
  String ? firstName;
  String ? lastName;
  String ? email;
  String ? password;
  String ? address;
  int ? gender;
  String ? dateOfBirth;
  String ? specialization;
  int ? phone;
  String ? refreshTokenValue;
  String ? photo;
  String ? bio;
  String ? video;

  DoctorDataModel.fromJson(Map<String, dynamic> json){
    id = json['ID'];
    doctorStatus = json['Doctor_Status'];
    adminId = json['Admin_ID'];
    firstName = json['F_Name'];
    lastName = json['L_Name'];
    email = json['Email'];
    password = json['Pass'];
    address = json['Address'];
    gender = json['Gender'];
    dateOfBirth = json['DOB'];
    specialization = json['Specialization'];
    phone = json['Phone'];
    refreshTokenValue = json['Refresh_Token_Value'];
    photo = json['Photo'];
    bio = json['Bio'];
    video = json['Vedio'];
  }
}