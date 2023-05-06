import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/shared/components/text_form_field_component.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/styles/colors.dart';
import '../../patinet_modules/patient_edit_profile/patient_edit_profile_screen.dart';
import '../../patinet_modules/patient_prescriptions/patient_prescriptions_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientProfileDoctorViewScreen extends StatelessWidget {
  PatientProfileDoctorViewScreen({Key? key}) : super(key: key);

  bool isPrescriptionVisible = true;
  bool isFollowUpWithVisible = true;
  bool isSymptomsVisible = true;
  bool isNotesVisible = true;
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientProfileDoctorViewCubit , PatientProfileDoctorViewStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        PatientProfileDoctorViewCubit cubit = PatientProfileDoctorViewCubit.get(context);
        return Scaffold(
          floatingActionButton: InkWell(
            onTap: (){
              
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor1BA,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                child: Text(
                  'Add Note',
                  style: TextStyle(
                    color: primaryWhiteColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 200,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: primaryColor4DC_20,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(8),
                                    bottomEnd: Radius.circular(8),
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      child: SvgPicture.asset('assets/icons/chat.svg'),
                                      onTap: (){

                                      },
                                    ),
                                    Spacer(),
                                    InkWell(
                                      child: SvgPicture.asset('assets/icons/telephone.svg'),
                                      onTap: (){

                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      DefaultImageShape(
                        isMale: true,
                        height: 80,
                        image: 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1677173572~exp=1677174172~hmac=94a6e1073a52704d51512902c48c715b8754414e819a4a9c88ad63bcbbc756ca',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Mohammed Ali',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Birth Date 21/2/2015',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Lives in Cairo, Egypt',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.height,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Height 165',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.line_weight,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Weight 70',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Email mohammedali@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.male,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Gender Male',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 28,
                            color: primaryColor1BA,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Phone 0155668665',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(),
                      InkWell(
                        onTap: (){
                          isSymptomsVisible = !isSymptomsVisible;
                          cubit.changeSymptomsVisibility(isSymptomsVisible);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Symptoms',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                  isSymptomsVisible == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down
                              ),
                            ],
                          ),
                        ),
                      ),
                      if(isSymptomsVisible)
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Wrap(
                              children: [
                                DefaultSymptomItem(
                                  nameOfSymptom: 'Headache',
                                ),
                                DefaultSymptomItem(
                                  nameOfSymptom: 'Stomach pain',
                                ),
                                DefaultSymptomItem(
                                  nameOfSymptom: 'shortness of breath',
                                ),
                                DefaultSymptomItem(
                                  nameOfSymptom: 'Headache',
                                ),
                                DefaultSymptomItem(
                                  nameOfSymptom: 'Stomach pain',
                                ),
                                DefaultSymptomItem(
                                  nameOfSymptom: 'shortness of breath',
                                ),
                              ],
                            ),
                          ),
                        ),
                      Divider(),
                      InkWell(
                        onTap: (){
                          isPrescriptionVisible = !isPrescriptionVisible;
                          cubit.changePrescriptionVisibility(isPrescriptionVisible);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Prescriptions',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                  isPrescriptionVisible == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down
                              ),
                            ],
                          ),
                        ),
                      ),
                      if(isPrescriptionVisible)
                        Column(
                          children: [
                            BuildPrescriptionItem(dateTime: '5 / 10 ? 2021', doctorName: 'Dr.Ali'),
                            BuildPrescriptionItem(dateTime: '5 / 10 ? 2021', doctorName: 'Dr.Ali'),
                            BuildPrescriptionItem(dateTime: '5 / 10 ? 2021', doctorName: 'Dr.Ali'),
                            BuildPrescriptionItem(dateTime: '5 / 10 ? 2021', doctorName: 'Dr.Ali'),
                          ],
                        ),
                      if(isPrescriptionVisible)
                        SizedBox(
                          height: 10,
                        ),
                      if(isPrescriptionVisible)
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: (){
                              navigateTo(context: context, widget: PatientPrescriptionScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                'SEE MORE',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 25,
                      ),

                      Divider(),
                      InkWell(
                        onTap: (){
                          isNotesVisible = !isNotesVisible;
                          cubit.changeNotesVisibility(isPrescriptionVisible);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Notes',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                  isNotesVisible == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down
                              ),
                            ],
                          ),
                        ),
                      ),
                      if(isNotesVisible)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    '1.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: primaryColor1BA,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Teeth pain',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    '1.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: primaryColor1BA,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Teeth pain',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
