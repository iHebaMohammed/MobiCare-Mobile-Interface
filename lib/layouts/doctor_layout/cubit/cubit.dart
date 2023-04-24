import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/modules/doctor_chats/doctor_chats_screen.dart';
import 'package:mobi_care/modules/doctor_home/doctor_home_screen.dart';
import 'package:mobi_care/modules/doctor_patients_list/doctor_patients_list_screen.dart';
import 'package:mobi_care/modules/doctor_time_reminder/doctor_time_reminder_screen.dart';

import '../../../models/user_model.dart';
import '../../../shared/constants/constants.dart';
import 'states.dart';

class DoctorLayoutCubit extends Cubit<DoctorLayoutStates> {
  DoctorLayoutCubit() : super(DoctorLayoutInitiateState());

  static DoctorLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> bottomScreens =  [
    DoctorTimeReminderScreen(),
    DoctorPatientsListScreen(),
    DoctorHomeScreen(),
    DoctorChatsScreen(),
  ];

  List<Widget> bottomNavIcons = [
    SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg' , width: 24,),
    SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
    // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
  ];

  void changeBottomIndex(int index){
    currentIndex = index;
    if(index == 0){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 1){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    } else if(index == 2){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 3){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      getChats();
    }else if(index == 4){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_active.svg'),
      ];
    }
    emit(DoctorLayoutChangeBottomNavigationBarState());
  }

  UserModel ? userModel;

  List<UserModel> users = [];

  void getChats(){
    emit(DoctorLayoutGetUsersInChatLoadingState());
    if(users.length == 0){
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if(element.data()['uId'] != uId)
            users.add(UserModel.fromJson(element.data()));
          emit(DoctorLayoutGetUsersInChatSuccessState());
        });
      }).catchError((error) {
        print(error.toString());
        emit(DoctorLayoutGetUsersInChatErrorState());
      });
    }

  }

}