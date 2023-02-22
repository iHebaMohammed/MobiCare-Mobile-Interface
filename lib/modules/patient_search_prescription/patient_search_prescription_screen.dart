import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';

class PatientSearchPrescriptionScreen extends StatelessWidget {
  PatientSearchPrescriptionScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            defaultTextFormFieldWithoutBorder(controller: searchController )
          ],
        ),
      ),
    );
  }
}
