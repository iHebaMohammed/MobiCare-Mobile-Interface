import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/user_model.dart';
import '../../../modules/doctor_modules/doctor_chats/doctor_chats_screen.dart';
import '../../../modules/doctor_modules/doctor_home/doctor_home_screen.dart';
import '../../../modules/doctor_modules/doctor_patients_list/doctor_patients_list_screen.dart';
import '../../../modules/doctor_modules/doctor_time_reminder/doctor_time_reminder_screen.dart';
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

  String getChatId({
    required String receiverUId,
  }){
    if(uId!.substring(0,1).codeUnitAt(0) > receiverUId.substring(0,1).codeUnitAt(0)){
      return '$receiverUId\_${uId!}';
    }else{
      return '${uId!}\_${receiverUId}';
    }
  }

  void createChat({required String receiverUId}) {

    List<String> users = [
      uId!,
      receiverUId
    ];
    Map<String , dynamic> chatMap = {
      'users': users,
      'chatId' : getChatId(receiverUId: receiverUId),
    };
    emit(DoctorLayoutCreateChatLoadingState());
    FirebaseFirestore.instance
        .collection('chats')
        .doc('${uId!}_$receiverUId')
        .set(chatMap)
        .then((value) {
      emit(DoctorLayoutCreateChatSuccessState());
    }).catchError((error){
      print('Error : ${error.toString()}');
      emit(DoctorLayoutCreateChatErrorState());
    });
  }

  List<UserModel> patients = [];
  Future<void> getAllDoctors() async{
    emit(DoctorLayoutGetAllPatientsLoadingState());
    if(patients.isEmpty){
      await FirebaseFirestore.instance
          .collection('patients')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          patients.add(UserModel.fromJson(element.data()));
        });
        emit(DoctorLayoutGetAllPatientsSuccessfullyState());
      }).catchError((error) {
        emit(DoctorLayoutGetAllPatientsErrorState());
        print(error.toString());
      });
    }
  }

  List<UserModel> users = [];
  List<String> chatsUsersId = [];
  Future<void> getChatsUsersId() async{
    List<String> chatsUsersId = [];
    await FirebaseFirestore.instance
        .collection('chats')
        .where('users' , arrayContains: uId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        for(int i = 0 ; i < patients.length ; i++){
          // print(doctors[i]);
          if(patients[i].uId == element.data().values.first.replaceAll(uId!, '').replaceAll('_', '').trim()){
            users.add(patients[i]);
          }
        }
        chatsUsersId.add(element.data().values.first.replaceAll(uId!, '').replaceAll('_', '').trim());
      });
      print(users);
    }).catchError((error) {
      emit(LayoutGetUsersInChatErrorState());
    });
  }


  void getChatsITalkWith(){
    emit(DoctorLayoutGetUsersLoadingState());
    if(chatsUsersId.isNotEmpty){
      for(int i = 0 ; i < chatsUsersId.length ; i++){
        for(int j = 0 ; j < patients.length ; j++){
          if(chatsUsersId[i] == patients[j].uId!){
            users.add(UserModel(
              uId: patients[j].uId,
              imageUrl: patients[j].imageUrl,
              lastName: patients[j].lastName,
              firstName: patients[j].firstName,
              role: patients[j].role,
              isMale: patients[j].isMale,
              address: patients[j].address,
              phoneNumber: patients[j].phoneNumber,
              email: patients[j].email,
            ));
            // users.add(patients[i]);
            print('users :   $users');
            print(users.length);
          }
          break;
        }
      }
      print('users ########: $users');
      print('Length: ${users.length}');
      emit(DoctorLayoutGetUsersSuccessfullyState());
    }
  }

  Future<void> getChats() async{
    await getAllDoctors().then((value) {
      getChatsUsersId().then((value) {
        getChatsITalkWith();
      });
    });
  }
}