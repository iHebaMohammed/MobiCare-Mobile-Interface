import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class PatientEditProfileCubit extends Cubit<PatientEditProfileStates> {
  PatientEditProfileCubit() : super(PatientEditProfileInitiateState());

  static PatientEditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  DateTime ? datePiker;
  bool ? isSymptomsVisible;

  void selectDatePiker(DateTime newDatePiker){
    datePiker = newDatePiker;
    emit(PatientEditProfileSelectDate());
  }
  void changeSymptomsVisibility(bool isVisible){
    isSymptomsVisible = isVisible;
    emit(PatientProfileChangeSymptomsContainerVisibility());
  }
}