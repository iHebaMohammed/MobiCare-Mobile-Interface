import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobi_care/shared/bloc_observer.dart';
import 'modules/splash/splash_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}
