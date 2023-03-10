import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/modules/patient_search_prescription/patient_search_prescription_screen.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import '../../shared/components/components.dart';
import '../../shared/components/navigate_component.dart';

class PatientPrescriptionScreen extends StatelessWidget {
  const PatientPrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: primaryColor1BA,
        child: Icon(
          Icons.add
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor1BA,
        centerTitle: true,
        title: Text(
          'Medical Prescription',
          style: TextStyle(
            color: primaryWhiteColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              navigateTo(context: context, widget: PatientSearchPrescriptionScreen());
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 270,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/shapes/top_shape.svg',
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/svg/prescription/prescription.svg',
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Here you can find your medical prescriptions',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(),
            ),
            buildPrescriptionItem(dateTime: '14 / 2 / 2001' , doctorName: 'Heba Adel'),
          ],
        ),
      ),
    );
  }
}
