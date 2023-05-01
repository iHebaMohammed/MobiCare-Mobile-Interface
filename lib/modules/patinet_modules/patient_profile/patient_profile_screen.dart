import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import '../../../shared/components/navigate_component.dart';
import '../patient_edit_profile/patient_edit_profile_screen.dart';
import '../patient_prescriptions/patient_prescriptions_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientProfileScreen extends StatelessWidget {
  PatientProfileScreen({Key? key}) : super(key: key);

  bool isPrescriptionVisible = true;
  bool isFollowUpWithVisible = true;
  bool isSymptomsVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientProfileCubit , PatientProfileStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        PatientProfileCubit cubit = PatientProfileCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 240,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: primaryColor4DC_20,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(8),
                                    bottomEnd: Radius.circular(8),
                                  )
                              ),
                              child: Row(
                                children: [

                                ],
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
                Text(
                  'Male',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: (){
                                navigateTo(context: context, widget: PatientEditProfileScreen());
                              },
                              child: Text(
                                'Edit Profile',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          OutlinedButton(
                            onPressed: (){
                              navigateTo(
                                context: context,
                                widget: PatientEditProfileScreen(),
                              );
                            },
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20
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
                                  Icons.keyboard_arrow_down
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
                      Divider(),
                      InkWell(
                        onTap: (){
                          isFollowUpWithVisible = !isFollowUpWithVisible;
                          cubit.changeFollowUpWithVisibility(isFollowUpWithVisible);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Follow up with',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                  Icons.keyboard_arrow_down
                              ),
                            ],
                          ),
                        ),
                      ),
                      if(isFollowUpWithVisible)
                        Column(
                          children: [
                            DefaultFollowUpWithItem(
                              isMale: true,
                              image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1677180364~exp=1677180964~hmac=322f62b372fd430840916df2f143ee731df2389d1888b370c1725cb50008f371',
                              name: 'Dr. Osama Ali',
                              specialization: 'Pulmonologist',
                            ),
                            DefaultFollowUpWithItem(
                              isMale: false,
                              image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1677180364~exp=1677180964~hmac=322f62b372fd430840916df2f143ee731df2389d1888b370c1725cb50008f371',
                              name: 'Dr. Asmaa Helal',
                              specialization: 'Pulmonologist',
                            ),
                          ],
                        ),
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
                                  Icons.keyboard_arrow_down
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
