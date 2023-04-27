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


  void createPatientUsingFirebase({
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
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/727/727369.png?w=740&t=st=1682386759~exp=1682387359~hmac=c7ad8bed588c7760e0b5701f3de6468304217539c53f8a9c018e3f8bcbba0b33',
      uId: uId,
      isMale: false,
      role: 'P',
    );
    emit(CreatePatientLoadingFirebaseState());
    FirebaseFirestore.instance
        .collection('patients')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
          emit(CreatePatientSuccessFirebaseState());
    }).catchError((error){
      emit(CreatePatientErrorFirebaseState());
      print(error.toString());
    });
  }

  void createDoctorUsingFirebase({
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
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/727/727369.png?w=740&t=st=1682386759~exp=1682387359~hmac=c7ad8bed588c7760e0b5701f3de6468304217539c53f8a9c018e3f8bcbba0b33',
      uId: uId,
      isMale: false,
      role: 'D',
    );
    emit(CreateDoctorLoadingFirebaseState());
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateDoctorSuccessFirebaseState());
    }).catchError((error){
      emit(CreateDoctorErrorFirebaseState());
      print(error.toString());
    });
  }

//   void userCreateByFirebase({
//     required String email ,
//     required String firstName,
//     required String lastName,
//     required String phone,
//     required String address,
//     required String uId,
// }){
//
//     UserModel userModel = UserModel(
//       email: email,
//       firstName: firstName,
//       lastName: lastName,
//       phoneNumber: phone,
//       address: address,
//       imageUrl: 'https://cdn-icons-png.flaticon.com/512/727/727369.png?w=740&t=st=1682386759~exp=1682387359~hmac=c7ad8bed588c7760e0b5701f3de6468304217539c53f8a9c018e3f8bcbba0b33',
//       uId: uId,
//       isMale: false,
//       role: 'D',
//     );
//
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uId)
//         .set(userModel.toMap())
//         .then((value) {
//          emit(CreateUserSuccessFirebaseState());
//     }).catchError((error) {
//       emit(CreateUserErrorFirebaseState(error: error));
//     });
//
//   }

  void registerPatientByFirebase({
    required String email ,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    String ? diseasesNote,
  }){
    emit(RegisterPatientLoadingFirebaseState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createPatientUsingFirebase(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterPatientErrorFirebaseState());

    });
  }

  void registerDoctorByFirebase({
    required String email ,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    String ? diseasesNote,
  }){
    emit(RegisterDoctorLoadingFirebaseState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createDoctorUsingFirebase(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterDoctorErrorFirebaseState());
    });
  }

//
//   void userRegisterByFirebase({
//     required String email ,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String phone,
//     required String address,
//     String ? diseasesNote,
//   }){
//     emit(RegisterLoadingFirebaseState());
//     FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password
//     ).then((value) {
//       print(value.user!.email);
//       print(value.user!.uid);
//       userCreateByFirebase(
//           email: email,
//           firstName: firstName,
//           lastName: lastName,
//           phone: phone,
//           address: address,
//           uId: value.user!.uid,
//       );
//       // emit(RegisterSuccessFirebaseState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(RegisterErrorFirebaseState(error: error));
//     });
//   }
}