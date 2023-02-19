import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../login/login_screen.dart';
import 'states.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){

    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }

  void userRegister({
    required String email ,
    required String password,
    required String firstName,
    required String lastName,
    required String address,
    required String phone,
    String ? question,
  }){
    emit(RegisterLoadingState());
    // DioHelper.postData(
    //     url: REGISTER ,
    //     data:
    //     {
    //       'name' : name,
    //       'phone': phone,
    //       'email' : email,
    //       'password' : password,
    //     }
    // ).then((value) {
    //   print(value.data);
    //   shopLoginModel = ShopLoginModel.fromJson(value.data);
    //   print(shopLoginModel?.message);
    //   print(shopLoginModel?.status);
    //   print(shopLoginModel?.data?.token);
    //   emit(RegisterSuccessState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(RegisterErrorState(error: error.toString()));
    // });
  }

  void userRegisterByFirebase({
    required String email ,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    String ? diseasesNote,
  }){
    emit(RegisterLoadingFirebaseState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(RegisterSuccessFirebaseState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorFirebaseState(error: error));
    });
  }
}