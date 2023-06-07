import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';

import 'status.dart';

class AdminLayoutCubit extends Cubit<AdminLayoutStatus> {
  AdminLayoutCubit() : super(InitiateAdminLayoutState());

  static AdminLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  void getNewAccessToken({
    required String refreshToken,
  }){
    emit(GetNewAccessTokenLoadingState());
    DioHelper.postData(
      url: GET_NEW_ACCESS_TOKEN,
      data: {
        'token':refreshToken,
      },
    ).then((value) {
      accessToken = value.data['accesstoken'];
      print(value.data['accesstoken']);
      emit(GetNewAccessTokenSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState(error: error.toString()));
    });
  }


  void AdminGetAllDoctors(){
    emit(AdminGetAllDoctorsLoadingState());

  }

}