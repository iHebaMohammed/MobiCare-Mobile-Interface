import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/login/login_screen.dart';
import 'package:mobi_care/modules/patient_prescriptions/patient_prescriptions_screen.dart';
import 'package:mobi_care/modules/patient_profile/patient_profile_screen.dart';
import 'package:mobi_care/modules/settings/settings_screen.dart';
import 'package:mobi_care/shared/components/components.dart';

import 'states.dart';

class DrawerLayoutCubit extends Cubit<DrawerLayoutStates>{
  DrawerLayoutCubit() : super(DrawerLayoutInitiateState());

  static DrawerLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int ? currentIndex;

  void changeScreen(int index , BuildContext context){
    currentIndex = index;
    if(currentIndex == DrawerSections.PROFILE){
      print(DrawerSections.PROFILE);
      navigateTo(context: context, widget: PatientProfileScreen());
    }else if(currentIndex == DrawerSections.PRESCRIPTIONS){
      navigateTo(context: context, widget: PatientPrescriptionScreen());
    }else if(currentIndex == DrawerSections.SETTING){
      navigateTo(context: context, widget: SettingScreen());
    }else if(currentIndex == DrawerSections.LOGOUT){
      navigateTo(context: context, widget: LoginScreen());
    }
    emit(DrawerLayoutChangeScreen());
  }
}

enum DrawerSections {
  PROFILE,
  PRESCRIPTIONS,
  SETTING,
  LOGOUT,
}
