import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/models/message_model.dart';
import 'package:mobi_care/modules/patient_chat/patient_chat_screen.dart';
import 'package:mobi_care/modules/patient_home/patient_home_screen.dart';
import 'package:mobi_care/modules/patient_medication_reminder/patient_medication_reminder_screen.dart';
import 'package:mobi_care/modules/patient_posts_view/patient_posts_view_screen.dart';
import '../../../models/user_model.dart';
import '../../../shared/components/constants.dart';
import 'states.dart';

class PatientLayoutCubit extends Cubit<PatientLayoutStates> {
  PatientLayoutCubit() : super(PatientLayoutInitiateState());

  static PatientLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> bottomScreens =  [
    PatientMedicationReminderScreen(),
    PatientPostsViewScreen(),
    PatientHomeScreen(),
    PatientChatScreen(),
    // PatientContactScreen(),
  ];

  List<Widget> bottomNavIcons = [
    SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
    // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
  ];

  void changeBottomIndex(int index){
    currentIndex = index;
    if(index == 0){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 1){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    } else if(index == 2){
      bottomNavIcons = [ SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 3){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      getChats();
    }else if(index == 4){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_active.svg'),
      ];
    }
    emit(PatientLayoutChangeBottomNavigationBarState());
  }

  UserModel ? userModel;

  List<UserModel> users = [];

  void getChats(){
    emit(LayoutGetUsersInChatLoadingState());
    if(users.length == 0){
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if(element.data()['uId'] != uId)
            users.add(UserModel.fromJson(element.data()));
          emit(LayoutGetUsersInChatSuccessState());
        });
      }).catchError((error) {
        print(error.toString());
        emit(LayoutGetUsersInChatErrorState());
      });
    }

  }

}