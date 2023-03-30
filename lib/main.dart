import 'package:first_app/layout/home_layout.dart';
import 'package:first_app/modules/doctor_chats/doctor_chats_screen.dart';
import 'package:first_app/modules/home_visit_requests/home_visit_requests.dart';
import 'package:first_app/modules/patient_profile/patient_profile.dart';
import 'package:first_app/modules/evaluation/evaluation_screen.dart';
import 'package:first_app/modules/prescription/prescription.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientProfile(),
    );
  }
}
