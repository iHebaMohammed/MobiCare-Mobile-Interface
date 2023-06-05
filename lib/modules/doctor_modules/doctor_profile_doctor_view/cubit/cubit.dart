import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/get_doctor_profile_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';

import 'states.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileStates> {
  DoctorProfileCubit() : super(DoctorProfileInitiateState());

  static DoctorProfileCubit get(BuildContext context) => BlocProvider.of(context);

  String ? token;
  void getNewAccessToken(){
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
      getDoctorProfile();
    }).catchError((error){
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  GetDoctorProfileModel ? doctorProfileModel;

  void getDoctorProfile(){
    emit(GetDoctorProfileLoadingState());
    DioHelper.getData(
      token: token,
      path: '${Get_Doctor_Profile}${asDoctorModel!.data!.iD}',
    ).then((value) {
      print(value.data);
      doctorProfileModel = GetDoctorProfileModel.fromJson(value.data);
      print(doctorProfileModel!.data!.email);
      emit(GetDoctorProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDoctorProfileErrorState());
    });
  }
}