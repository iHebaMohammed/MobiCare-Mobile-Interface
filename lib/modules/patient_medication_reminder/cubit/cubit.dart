import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/patient_medication_reminder/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class PatientMedicationReminderCubit extends Cubit<PatientMedicationReminderStates>{
  PatientMedicationReminderCubit():super(InitiatePatientMedicationReminderState());

  static PatientMedicationReminderCubit get(BuildContext context) => BlocProvider.of(context);

  Database ? database;

  // void createDatabase() async {
  //   database = await openDatabase(
  //       'medication_reminder.db',
  //       version: 1,
  //       onCreate: (database , version) {
  //         print('Database Created');
  //         database.execute(
  //             'CREATE TABLE medications (id INTEGER PRIMARY KEY , name TEXT , description TEXT , time TEXT)'
  //         ).then((value){
  //           print('Table Created');
  //         }).catchError((error){
  //           print('Error in Create a Table ${error.toString()}');
  //         });
  //       },
  //       onOpen: (database) async{
  //         await getDateFromDatabase(database).then((value) {
  //           medication = value;
  //           emit(AppGetDatabaseState());
  //         });
  //         print('Database Opened');
  //       }
  //   ).then((value){
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }
}