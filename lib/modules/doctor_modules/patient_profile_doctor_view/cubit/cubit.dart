
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class PatientProfileDoctorViewCubit extends Cubit<PatientProfileDoctorViewStates> {
  PatientProfileDoctorViewCubit() : super(PatientProfileDoctorViewInitiateState());

  static PatientProfileDoctorViewCubit get(BuildContext context) => BlocProvider.of(context);

  bool ? isPrescriptionVisible;
  bool ? isFollowUpWithVisible;
  bool ? isSymptomsVisible;
  bool ? isNotesVisible;


  void changePrescriptionVisibility(bool isVisible){
    isPrescriptionVisible = isVisible;
    emit(PatientProfileDoctorViewChangePrescriptionContainerVisibility());
  }

  void changeNotesVisibility(bool isVisible){
    isNotesVisible = isVisible;
    emit(PatientProfileDoctorViewChangeNotesContainerVisibility());
  }

  void changeFollowUpWithVisibility(bool isVisible){
    isFollowUpWithVisible = isVisible;
    emit(PatientProfileDoctorViewChangeFollowUpWithContainerVisibility());
  }

  void changeSymptomsVisibility(bool isVisible){
    isSymptomsVisible = isVisible;
    emit(PatientProfileDoctorViewChangeSymptomsContainerVisibility());
  }
}