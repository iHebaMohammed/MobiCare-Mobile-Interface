import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/patient_component_in_patients_list.dart';
import 'package:mobi_care/shared/styles/colors.dart';


class DoctorPatientsListScreen extends StatelessWidget {
  const DoctorPatientsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) => PatientComponentInPatientsList(
              image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1680986239~exp=1680986839~hmac=347c4a3241d1741a6b0c5f19e693282afa09b3a37fb08d3cbca683d11e4ba3fb',
              isMale: true,
              function: (){},
              name: 'Mohammed Ali',
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
          ),
        ),
      ),
    );
  }
}
