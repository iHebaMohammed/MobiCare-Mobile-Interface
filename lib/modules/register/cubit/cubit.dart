import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/models/user_model.dart';
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


  void userCreateByFirebase({
    required String email ,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String uId,
}){

    UserModel userModel = UserModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phone,
      address: address,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1676862815~exp=1676863415~hmac=d7a606f49dd55d1e9b966c52ae63fa89c8073e562ea0dd048658e9d7aaf4f6a9',
      uId: uId,
      isMale: false,
      role: 'D',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
         emit(CreateUserSuccessFirebaseState());
    }).catchError((error) {
      emit(CreateUserErrorFirebaseState(error: error));
    });

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

      userCreateByFirebase(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          address: address,
          uId: value.user!.uid,
      );
      // emit(RegisterSuccessFirebaseState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorFirebaseState(error: error));
    });
  }
}