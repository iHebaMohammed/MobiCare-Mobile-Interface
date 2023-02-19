import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layouts/patient_layout/patient_layout.dart';
import '../../../shared/components/components.dart';
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

  void userLogin({required String email ,
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
      emit(LoginSuccessFirebaseState(uId: value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorFirebaseState(error: error.toString()));
    });
  }
}