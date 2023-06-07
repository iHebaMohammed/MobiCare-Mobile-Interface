
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/note_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import '../../../../models/get_symptoms_model.dart';
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

  NoteModel ? noteModel;

  void addNote({
    required int patientId,
    required String note,
  }){
    emit(AddNoteLoadingState());
    DioHelper.postData(
      url: ADD_NOTE_TO_PATIENT,
      data: {
        'DOCTOR_ID' : asDoctorModel!.data!.iD,
        'PATIENT_ID' : patientId,
        'NOTE' : note
      },
      token: asDoctorModel!.accessToken
    ).then((value) {
      noteModel = NoteModel.fromJson(value.data);
      print('NOTES: ********************');
      print(noteModel!.data);
      print(noteModel!.message);
      emit(AddNoteSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(AddNoteErrorState());
    });
  }

  void getNotes({
    required int patientId,
}){
    emit(GetNoteLoadingState());
    DioHelper.getData(
      path: GET_PATIENT_NOTES,
      queryParameters: {
        'DOCTOR_ID' : asDoctorModel!.data!.iD,
        'PATIENT_ID' : patientId,
      },
      token: asDoctorModel!.accessToken
    ).then((value) {
      noteModel = NoteModel.fromJson(value.data);
      print('NOTES: ********************');
      print(noteModel!.data);
      print(noteModel!.message);
      emit(GetNoteSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(GetNoteErrorState());
    });
  }

  GetSymptomsModel ? symptoms ;

  Future<void> getSymptoms({
    required int patientId
  }){
    emit(GetSymptomsLoadingState());
    return DioHelper.getData(
        path: Get_Symptoms,
        queryParameters: {
          'id': patientId,
        },
    ).then((value) {
      symptoms = GetSymptomsModel.fromJson(value.data);
      print(symptoms!.data!.length);
      print(symptoms);
      print(symptoms!.data![0].symptom);
      print('##############');
      emit(GetSymptomsSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(GetSymptomsErrorState());
    });
  }
}