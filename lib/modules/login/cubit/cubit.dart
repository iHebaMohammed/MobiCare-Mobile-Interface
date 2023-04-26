import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/admin_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import '../../../layouts/patient_layout/patient_layout.dart';
import '../../../shared/components/components.dart';
import 'states.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) =>BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibility());
  }

  void userLogin({
    required String email ,
    required String password
  }){
    // emit(LoginLoadingState());
    // DioHelper.postData(
    //     url: LOGIN ,
    //     data:
    //     {
    //       'email' : email,
    //       'password' : password,
    //     }
    // ).then((value) {
    //   print(value.data);
    //   shopLoginModel = ShopLoginModel.fromJson(value.data);
    //   print(shopLoginModel?.message);
    //   print(shopLoginModel?.status);
    //   print(shopLoginModel?.data?.token);
    //   emit(LoginSuccessState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(LoginErrorState());
    // });
  }


  void userLoginByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginLoadingFirebaseState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      uId = value.user!.uid;
      emit(LoginSuccessFirebaseState(uId: value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorFirebaseState(error: error.toString()));
    });
  }

  void loginPatientByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginPatientLoadingFirebaseState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      uId = value.user!.uid;
      emit(LoginPatientSuccessFirebaseState(uId: value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginPatientErrorFirebaseState(error: error.toString()));
    });
  }

  void loginDoctorByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginDoctorLoadingFirebaseState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      uId = value.user!.uid;
      emit(LoginDoctorSuccessFirebaseState(uId: value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginPatientErrorFirebaseState(error: error.toString()));
    });
  }

  // Future<void> adminLogin({
  //   required String email,
  //   required String password,
  // }) async{
  //
  //   String url = 'http://127.0.0.1:4000$ADMIN_LOGIN';
  //   Map<String, dynamic> data = {
  //     'EMAIL': email,
  //     'PASSWORD':password,
  //   };
  //   var jsonData = jsonEncode(data);
  //
  //   try{
  //     emit(AdminLoginLoadingState());
  //     http.Response response = await http.post(
  //       Uri.parse(url),
  //       body: jsonData
  //     );
  //     // adminAccessToken = json.decode(response.body)['accessToken'];
  //     print(json.decode(response.body));
  //
  //     // AdminModel adminModel = AdminModel.fromJson(json.decode(response.body));
  //     // print(adminModel.message);
  //     emit(AdminLoginSuccessfullyState());
  //     if(response.statusCode == 200 ){
  //
  //     }
  //
  //   }catch(error){
  //     print('ERROR  ${error.toString()}');
  //   }
  // }

  AdminModel ? adminModel;

  void adminLogin({
    required String email ,
    required String password,
  }){
    emit(AdminLoginLoadingState());
    print('Email : $email , Password: $password');
    DioHelper.postData(
      url: ADMIN_LOGIN,
      data: {
        'EMAIL': email,
        'PASSWORD': password,
      },
    ).then((value) {
      print(value);
      adminModel = AdminModel.fromJson(value.data);
      print('Message : ${adminModel!.message}');
      print('Token: ${adminModel!.accessToken}');
    }).catchError((error){
      print(error.toString());
      emit(AdminLoginErrorState(error: error.toString()));
      print('ERROR : ${error.toString()}');
    });
  }
}