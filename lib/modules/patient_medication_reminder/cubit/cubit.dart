import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/patient_medication_reminder/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class PatientMedicationReminderCubit extends Cubit<PatientMedicationReminderStates>{
  PatientMedicationReminderCubit():super(InitiatePatientMedicationReminderState());

  static PatientMedicationReminderCubit get(BuildContext context) => BlocProvider.of(context);

  Database ? database;
  DateTime ? dateTime;

  void changeDateTime(DateTime time){
    dateTime = time;
    emit(ChangeDateTimeInPatientState());
  }


  void createDatabase() async{
    database = await openDatabase(
      'patient_medicine.db',
      version: 1,
      onCreate: (Database database , int version){
        emit(CreatePatientMedicationDatabaseLoadingState());
        database.execute('''
          CREATE TABLE medicine_table (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            time TEXT NOT NULL,
            description TEXT
          )
        ''').then((value) {
          emit(CreatePatientMedicationDatabaseSuccessState());
          print('table has created');
        }).catchError((error){
          emit(CreatePatientMedicationDatabaseErrorState());
          print('Some error has happen in create ${error.toString()}');
        });
        print('database is created');
      },
      onOpen: (database){
        print('database is opened');
      }
    );
  }

  void insertToDatabase({
    required String nameOfMedicine ,
    required String timeOfMedicine ,
    String description = "",
}) async{
    await database!.transaction((txn) async{
      emit(InsertPatientMedicationDatabaseLoadingState());
      await txn.rawInsert('''
        INSERT INTO medicine_table ( name , time , description ) VALUES("${nameOfMedicine}" , "${timeOfMedicine}" , "${description}")
      ''').then((value) {
        emit(InsertPatientMedicationDatabaseSuccessState());
        print('$value inserted successfully');
      }).catchError((error){
        emit(InsertPatientMedicationDatabaseErrorState());
        print('Some error happen in insert ${error.toString()}');
      });
    });
  }

  

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