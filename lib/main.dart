import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/patient_layout/cubit/cubit.dart';
import 'layouts/patient_layout/cubit/states.dart';
import 'modules/patinet_modules/patient_edit_profile/cubit/cubit.dart';
import 'modules/patinet_modules/patient_medication_reminder/cubit/cubit.dart';
import 'modules/patinet_modules/patient_prescriptions/cubit/cubit.dart';
import 'modules/patinet_modules/patient_profile/cubit/cubit.dart';

import 'modules/doctor_modules/patient_profile_doctor_view/cubit/cubit.dart';
import 'modules/doctor_modules/doctor_time_reminder/cubit/cubit.dart';

import 'modules/shared_modules/chat_details/cubit/cubit.dart';
import 'modules/shared_modules/login/login_screen.dart';
import 'modules/shared_modules/payment/cubit/cubit.dart';

import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';
import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
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
            create: (context) => PatientProfileCubit()..getNewAccessToken(),
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
        BlocProvider(
          create: (context) => PrescriptionCubit()..initialSetup(),
        ),
        BlocProvider(
          create: (context) => PatientProfileDoctorViewCubit(),
        ),
        BlocProvider(
          create: (context) => DoctorProfileCubit()..getNewAccessToken(),
        ),
      ],
      child: BlocConsumer<PatientLayoutCubit, PatientLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
