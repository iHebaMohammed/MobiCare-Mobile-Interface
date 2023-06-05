
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/edit_doctor_profile_model.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';
import 'states.dart';

class DoctorEditProfileCubit extends Cubit<DoctorEditProfileStates> {
  DoctorEditProfileCubit() : super(DoctorEditProfileInitiateState());

  static DoctorEditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  String ? token;
  void getNewAccessToken({
    required String fName,
    required String lName,
    required String email,
    required String address,
    required String phone,
    String ? password,
    required String bio,
}){
    emit(GetNewAccessTokenLoadingState());
    DioHelper.postData(
      url: GET_NEW_ACCESS_TOKEN,
      data: {
        'token': asDoctorModel!.refreshToken!,
      },
    ).then((value) {
      accessToken = value.data['accesstoken'];
      token = value.data['accesstoken'];
      print(accessToken);
      emit(GetNewAccessTokenSuccessfullyState());
      editDoctorProfile(
          fName: fName,
          lName: lName ,
          address: address ,
          email: email ,
          phone: phone,
          password: password,
          bio: bio,
      );
    }).catchError((error){
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  EditDoctorProfileModel ? editDoctorProfileModel;

  void editDoctorProfile({
    required String fName,
    required String lName,
    required String email,
    required String address,
    required String phone,
    String ? password,
    required String bio,
  }){
    emit(DoctorEditProfileLoadingState());
    DioHelper.postData(
      url: Edit_Doctor_Profile,
      data: {
        'STATUS' : 'Disabled',
        'DOCTOR_FIRST_NAME' : fName,
        'DOCTOR_LAST_NAME' : lName,
        'DOCTOR_EMAIL' : email,
        'ADDRESS' : address,
        'GENDER' : asDoctorModel!.data!.gender,
        'DOB' : asDoctorModel!.data!.dOB,
        'SPECIALIZATION' : asDoctorModel!.data!.specialization,
        'BIO' : bio,
      },
    ).then((value) {
      editDoctorProfileModel = EditDoctorProfileModel.fromJson(value.data);
      print(value.data);
      print(editDoctorProfileModel);
      emit(DoctorEditProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorEditProfileErrorState());
    });
  }
}
