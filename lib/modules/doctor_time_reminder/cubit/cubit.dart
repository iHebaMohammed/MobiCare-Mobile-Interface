import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'states.dart';

class DoctorTimeReminderCubit extends Cubit<DoctorTimeReminderStates>{
  DoctorTimeReminderCubit():super(InitiateDoctorTimeReminderState());

  static DoctorTimeReminderCubit get(BuildContext context) => BlocProvider.of(context);

  Database ? database;
  DateTime ? dateTime;
  List<Map<String , dynamic>> tasks = [];

  void changeDateTime(DateTime time){
    dateTime = time;
    emit(ChangeDateTimeInDoctorState());
  }


  void createDatabase() async{
    database = await openDatabase(
        'doctor_time_tasks.db',
        version: 1,
        onCreate: (Database database , int version){
          emit(CreateDoctorTimeDatabaseLoadingState());
          database.execute('''
          CREATE TABLE tasks_table (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            time TEXT NOT NULL,
            description TEXT
          )
        ''').then((value) {
            emit(CreateDoctorTimeDatabaseSuccessState());
            print('table has created');
          }).catchError((error){
            emit(CreateDoctorTimeDatabaseErrorState());
            print('Some error has happen in create ${error.toString()}');
          });
          print('database is created');
        },
        onOpen: (database){
          emit(GetAllDoctorTimeDatabaseLoadingState());
          getDataFromDatabase(database).then((value) {
            emit(GetAllDoctorTimeDatabaseSuccessState());
            tasks = value;
            print(tasks);
          }).catchError((error){
            emit(GetAllDoctorTimeDatabaseErrorState());
            print('Some error happen in get data from database: ${error.toString()}');
          });
          print('database is opened');
        }
    );
  }

  void insertToDatabase({
    required String titleOfTask ,
    required String timeOfTask ,
    String description = "",
  }) async{
    await database!.transaction((txn) async{
      emit(InsertDoctorTimeDatabaseLoadingState());
      await txn.rawInsert('''
        INSERT INTO tasks_table ( title , time , description ) VALUES("${titleOfTask}" , "${timeOfTask}" , "${description}")
      ''').then((value) {
        getDataFromDatabase(database!).then((value) {
          emit(GetAllDoctorTimeDatabaseSuccessState());
          tasks = value;
          print(tasks);
        }).catchError((error){
          emit(GetAllDoctorTimeDatabaseErrorState());
          print('Some error happen in get data from database: ${error.toString()}');
        });
        emit(InsertDoctorTimeDatabaseSuccessState());
        print('$value inserted successfully');
      }).catchError((error){
        emit(InsertDoctorTimeDatabaseErrorState());
        print('Some error happen in insert ${error.toString()}');
      });
    });
  }

  Future<List<Map<String , dynamic>>> getDataFromDatabase(Database database) async{
    emit(GetAllDoctorTimeDatabaseLoadingState());
    return await database!.rawQuery('''
      SELECT *
      FROM tasks_table
    ''');
  }

  void deleteData({
    required int id,
  }) async{
    emit(DeleteDoctorTimeDatabaseLoadingState());
    await database!.rawDelete('DELETE FROM tasks_table WHERE id = $id').
    then((value) {
      getDataFromDatabase(database!).then((value) {
        emit(GetAllDoctorTimeDatabaseSuccessState());
        tasks = [];
        tasks = value;
        print(tasks);
      }).catchError((error){
        emit(GetAllDoctorTimeDatabaseErrorState());
        print('Some error happen in get data from database: ${error.toString()}');
      });
      emit(DeleteDoctorTimeDatabaseSuccessState());
    }).catchError((error){
      emit(DeleteDoctorTimeDatabaseErrorState());
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