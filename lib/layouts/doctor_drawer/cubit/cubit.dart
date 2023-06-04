import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/doctor_modules/doctor_profile_doctor_view/doctor_profile_doctor_view_sceen.dart';
import '../../../modules/patinet_modules/patient_prescriptions/patient_prescriptions_screen.dart';
import '../../../modules/shared_modules/login/login_screen.dart';
import '../../../modules/shared_modules/settings/settings_screen.dart';
import '../../../shared/components/navigate_component.dart';
import 'status.dart';

class DoctorDrawerLayoutCubit extends Cubit<DoctorDrawerLayoutStates>{
  DoctorDrawerLayoutCubit() : super(DoctorDrawerLayoutInitiateState());

  static DoctorDrawerLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int ? currentIndex;

  void changeScreen(int index , BuildContext context){
    currentIndex = index;
    if(currentIndex == 0){
      navigateTo(context: context, widget: DoctorProfileDoctorViewScreen());
    }else if(currentIndex == 1){
      navigateTo(context: context, widget: PatientPrescriptionScreen());
    }else if(currentIndex == 2){
      navigateTo(context: context, widget: SettingScreen());
    }else if(currentIndex == 3){
      navigateTo(context: context, widget: LoginScreen());
    }
    emit(DoctorDrawerLayoutChangeScreen());
  }
}