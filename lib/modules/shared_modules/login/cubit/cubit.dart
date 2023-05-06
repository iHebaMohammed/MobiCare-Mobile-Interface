import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/admin_model.dart';
import 'package:mobi_care/models/doctor_login_model.dart';
import 'package:mobi_care/models/patient_login_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import 'states.dart';


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
  
  Future<void> userLogin({
    required String email ,
    required String password
  }){
    emit(LoginLoadingState());
    return DioHelper.postData(
        url: LOGIN ,
        data:
        {
          'EMAIL' : email,
          'PASSWORD' : password,
        }
    ).then((value) {
      role = value.data['role'];
      print(value.data);
      if(value.data['role'] == 'DOCTOR'){
        doctorLoginModel = DoctorLoginModel.fromJson(value.data);
      }else{
        patientLoginModel = PatientLoginModel.fromJson(value.data);
      }
      emit(UserLoginSuccessfullyState(token: value.data['accessToken']));
    }).catchError((error) {
      print(error.toString());
      emit(UserLoginErrorState(error: error.toString()));
    });
  }


  Future<void> userLoginByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginLoadingFirebaseState());
    return FirebaseAuth.instance.signInWithEmailAndPassword(
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

  Future<void> loginPatientByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginPatientLoadingFirebaseState());
    return FirebaseAuth.instance.signInWithEmailAndPassword(
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

  Future<void> loginDoctorByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginDoctorLoadingFirebaseState());
    return FirebaseAuth.instance.signInWithEmailAndPassword(
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

  void login({
    required String email ,
    required String password,
  }){
    userLogin(email: email, password: password).then((value) {
      if(role == 'DOCTOR'){
        loginDoctorByFirebase(email: email, password: password).then((value) {
          emit(MainDoctorLoginSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(MainDoctorLoginErrorState(error: error.toString()));
        });
      }else{
        loginPatientByFirebase(email: email, password: password).then((value) {
          emit(MainPatientLoginSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(MainDoctorLoginErrorState(error: error.toString()));
        });
      }
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