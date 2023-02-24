import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/patient_edit_profile/cubit/cubit.dart';
import 'package:mobi_care/modules/patient_edit_profile/cubit/states.dart';
import 'package:mobi_care/shared/components/components.dart';

import '../../shared/styles/colors.dart';

class PatientEditProfileScreen extends StatelessWidget {
  PatientEditProfileScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  DateTime dateOfBirth = DateTime.now();
  bool isSymptomsVisible = true;

  List<int> addItemsInWeightList(){
    List<int> widthList = [];
    for(int i = 4 ; i <= 200 ; i++){
      widthList.add(i);
    }
    return widthList;
  }


  List<int> addItemsInHeightList(){
    List<int> widthList = [];
    for(int i = 90 ; i <= 190 ; i++){
      widthList.add(i);
    }
    return widthList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientEditProfileCubit , PatientEditProfileStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        PatientEditProfileCubit cubit = PatientEditProfileCubit.get(context);
        dateOfBirthController.text = cubit.datePiker != null ? '${cubit.datePiker!.day} / ${cubit.datePiker!.month} / ${cubit.datePiker!.year}' : '${dateOfBirth.day} / ${dateOfBirth.month} / ${dateOfBirth.year}';
        return Scaffold(
          floatingActionButton: InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor1BA,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0 , horizontal: 20),
                child: Text(
                  'Add Symptom',
                  style: TextStyle(
                    color: primaryWhiteColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
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
                                  color: primaryColor1BA,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(8),
                                    bottomEnd: Radius.circular(8),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          SizedBox(
                            width: 115,
                            child: defaultImageShape(
                                isMale: true,
                                height: 80,
                                image: 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1677173572~exp=1677174172~hmac=94a6e1073a52704d51512902c48c715b8754414e819a4a9c88ad63bcbbc756ca'
                            ),
                          ),
                          IconButton(
                            onPressed: (){

                            },
                            icon: CircleAvatar(
                              backgroundColor: primaryColor1BA,
                              radius: 15,
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
                  padding: const EdgeInsetsDirectional.only(top: 8.0 , start: 20.0 , end: 20.0 , bottom: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildColumnTextField(
                                controller: firstNameController,
                                labelName: 'First Name',
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'First Name can\'t be empty';
                                  }
                                  return null;
                                }
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: buildColumnTextField(
                                controller: lastNameController,
                                labelName: 'Last Name',
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Last Name can\'t be empty';
                                  }
                                  return null;
                                }
                            ),
                          ),
                        ],
                      ),
                      buildColumnTextField(
                          controller: emailController,
                          labelName: 'Email',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Email can\'t be empty';
                            }
                            return null;
                          }
                      ),
                      buildColumnTextField(
                          controller: passwordController,
                          labelName: 'Password',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Password can\'t be empty';
                            }
                            return null;
                          }
                      ),
                      buildColumnTextField(
                          controller: confirmPasswordController,
                          labelName: 'Confirm Password',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Confirm Password can\'t be empty';
                            }else if(value != passwordController.text){
                              return 'Confirm Password Filed not match Password Filed';
                            }
                            return null;
                          }
                      ),
                      buildColumnTextField(
                          controller: addressController,
                          labelName: 'Address',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Address can\'t be empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Date of birth',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                          onTap: () async{
                            DateTime ? newDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1950),
                              initialDate: DateTime(2001 , 1 , 15),
                              lastDate: DateTime.now(),
                            );
                            if(newDate != null)
                              cubit.selectDatePiker(newDate);
                          },
                          child: TextFormField(
                            enabled: false,
                            controller: dateOfBirthController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Address can\'t be empty';
                              }
                              return null;
                            },
                          ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Weight'
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: primaryWhiteColor
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Row(
                                      children: [
                                        DropdownButton<String>(
                                          value: '${addItemsInWeightList().first.toString()}',
                                          underline: Container(
                                            color: primaryColor1BA,
                                            height: 1,
                                          ),
                                          icon: Container(),
                                          elevation: 16,
                                          onChanged: (String? value) {

                                          },
                                          items: addItemsInWeightList().map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value.toString(),
                                              child: Text(value.toString()),
                                            );
                                          }).toList(),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Height'
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: primaryWhiteColor
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Row(
                                      children: [
                                        DropdownButton<String>(
                                          value: '${addItemsInHeightList().first.toString()}',
                                          underline: Container(
                                            color: primaryColor1BA,
                                            height: 1,
                                          ),
                                          icon: Container(),
                                          elevation: 16,
                                          onChanged: (value) {

                                          },
                                          items: addItemsInHeightList().map<DropdownMenuItem<String>>((value) {
                                            return DropdownMenuItem<String>(
                                              value: value.toString(),
                                              child: Text(value.toString()),
                                            );
                                          }).toList(),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                defaultSymptomWithRemoveItem(nameOfSymptom: 'Headache'),
                                defaultSymptomWithRemoveItem(
                                  nameOfSymptom: 'Stomach pain',
                                ),
                                defaultSymptomWithRemoveItem(
                                  nameOfSymptom: 'shortness of breath',
                                ),
                                defaultSymptomWithRemoveItem(
                                  nameOfSymptom: 'Headache',
                                ),
                                defaultSymptomWithRemoveItem(
                                  nameOfSymptom: 'Stomach pain',
                                ),
                                defaultSymptomWithRemoveItem(
                                  nameOfSymptom: 'shortness of breath',
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
