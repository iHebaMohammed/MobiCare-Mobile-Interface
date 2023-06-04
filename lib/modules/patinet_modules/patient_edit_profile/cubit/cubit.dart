import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/add_symptoms_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';

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

  String tallValue = '49';

  List<DropdownMenuItem<String>> get tallItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text('49'), value: '49'),
      for (int i = 50; i < 250; i++)
        DropdownMenuItem(child: Text('${i++}'), value: '${i++}'),
    ];
    return menuItems;
  }

  void changeTallValue(String newValue) {
    tallValue = newValue;
    emit(ChangeTallState());
  }

  String weightValue = '19';

  List<DropdownMenuItem<String>> get weightItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text('19'), value: '19'),
      for (int j = 20; j < 500; j++)
        DropdownMenuItem(child: Text('${j++}'), value: '${j++}'),
    ];
    return menuItems;
  }

  void changeWeightValue(String newValue) {
    weightValue = newValue;
    emit(ChangeWeightState());
  }

  AddSymptomsModel ? addSymptomsModel;
  void addSymptom({
    required String symptom,
  }){
    emit(AddSymptomLoadingState());
    DioHelper.postData(
      url: Add_Symptom,
      data: {
        'id': asPatientModel!.data!.iD!,
        'symptom': symptom,
      },
    ).then((value) {
      addSymptomsModel = AddSymptomsModel.fromJson(value.data);
      print(value.data['message']);
      emit(AddSymptomSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(AddSymptomErrorState());
    });
  }

}