import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_layout/doctor_layout.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/cubit.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/states.dart';
import 'package:mobi_care/layouts/patient_layout/patient_layout.dart';
import 'package:mobi_care/modules/chat_details/cubit/cubit.dart';
import 'package:mobi_care/modules/doctor_edit_profile/doctor_edit_profile_screen.dart';
import 'package:mobi_care/modules/doctor_time_reminder/cubit/cubit.dart';
import 'package:mobi_care/modules/login/login_screen.dart';
import 'package:mobi_care/modules/patient_edit_profile/cubit/cubit.dart';
import 'package:mobi_care/modules/patient_medication_reminder/cubit/cubit.dart';
import 'package:mobi_care/modules/patient_profile/cubit/cubit.dart';
import 'package:mobi_care/modules/payment/cubit/cubit.dart';
import 'package:mobi_care/modules/payment/payment_screen.dart';
import 'package:mobi_care/modules/payment_done/payment_done_screen.dart';
import 'package:mobi_care/shared/bloc_observer.dart';
import 'modules/doctor_home/doctor_home_screen.dart';
import 'modules/patient_prescriptions/patient_prescriptions_screen.dart';
import 'modules/post_details/post_details_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'shared/constants/constants.dart';
import 'shared/styles/themes.dart';
import 'shared/network/local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData( key: 'isDark');



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PatientLayoutCubit()..getChats(),
        ),
        BlocProvider(
            create: (context) => ChatMessagesCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
        BlocProvider(
            create: (context) => PatientProfileCubit(),
        ),
        BlocProvider(
          create: (context) => PatientEditProfileCubit(),
        ),
        BlocProvider(
          create: (context) => PatientMedicationReminderCubit()..createDatabase()
        ),
        BlocProvider(
          create: (context) => DoctorTimeReminderCubit()..createDatabase(),
        ),
      ],
      child: BlocConsumer<PatientLayoutCubit , PatientLayoutStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: DoctorLayout(),
          );
        },
      ),
    );
  }
}
