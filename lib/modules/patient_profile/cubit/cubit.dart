import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/patient_profile/cubit/states.dart';

class PatientProfileCubit extends Cubit<PatientProfileStates> {
  PatientProfileCubit() : super(PatientProfileInitiateState());

  static PatientProfileCubit get(BuildContext context) => BlocProvider.of(context);

  bool ? isPrescriptionVisible;
  bool ? isFollowUpWithVisible;
  bool ? isSymptomsVisible;


  void changePrescriptionVisibility(bool isVisible){
    isPrescriptionVisible = isVisible;
    emit(PatientProfileChangePrescriptionContainerVisibility());
  }

  void changeFollowUpWithVisibility(bool isVisible){
    isFollowUpWithVisible = isVisible;
    emit(PatientProfileChangeFollowUpWithContainerVisibility());
  }

  void changeSymptomsVisibility(bool isVisible){
    isSymptomsVisible = isVisible;
    emit(PatientProfileChangeSymptomsContainerVisibility());
  }
}