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
    if(currentIndex == 0){
      navigateTo(context: context, widget: PatientProfileScreen());
    }else if(currentIndex == 1){
      navigateTo(context: context, widget: PatientPrescriptionScreen());
    }else if(currentIndex == 2){
      navigateTo(context: context, widget: SettingScreen());
    }else if(currentIndex == 3){
      navigateTo(context: context, widget: LoginScreen());
    }
    emit(DrawerLayoutChangeScreen());
  }
}