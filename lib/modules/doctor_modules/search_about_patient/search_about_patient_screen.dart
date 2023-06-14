import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/modules/doctor_modules/search_about_patient/cubit/cubit.dart';
import 'package:mobi_care/modules/doctor_modules/search_about_patient/cubit/states.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/components/text_form_field_component.dart';

import '../patient_profile_doctor_view/patient_profile_doctor_view_screen.dart';


class SearchAboutPatientScreen extends StatelessWidget {
  SearchAboutPatientScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  bool loadList = false;
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchAboutPatientCubit(),
      child: BlocConsumer<SearchAboutPatientCubit , SearchAboutPatientStates>(
        listener: (context, state) {
          if(state is SearchAboutPatientSuccessfullyState) {
            loadList = true;
          }
        },
        builder: (context, state) {
          SearchAboutPatientCubit cubit = SearchAboutPatientCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0 , vertical: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      DefaultTextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        validation: (value){
                          if(value!.isEmpty){
                            return 'Can\'t be empty';
                          }
                          return null;
                        },
                        onSubmit: (value){
                          if(formKey.currentState!.validate()){
                            cubit.searchPatient(
                                fName: searchController.text.toString()
                            );
                          }
                        },
                        fieldName: 'Search',
                        suffixIcon: Icons.search,
                        redius: 10,
                        onChange: (value) {
                          if(formKey.currentState!.validate()){
                            cubit.searchPatient(
                                fName: searchController.text.toString()
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: loadList,
                        builder: (context) => ConditionalBuilder(
                          condition: cubit.searchPatientModel!.data!.isNotEmpty,
                          builder: (context) => Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: (){
                                  navigateTo(context: context, widget: PatientProfileDoctorViewScreen(data: cubit.searchPatientModel!.data![index],));
                                },
                                child: DefaultSearchUserViewItem(
                                  isMale: cubit.searchPatientModel!.data![index].gender == 0 ? false : true,
                                  image:'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                                  name: '${cubit.searchPatientModel!.data![index].fName} ${cubit.searchPatientModel!.data![index].lName}',
                                ),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                              itemCount: cubit.searchPatientModel!.data!.length,
                            ),
                          ),
                          fallback: (context) => Center(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/search_doctor.svg',
                                  width: 150,
                                  height: 150,
                                ),
                                Text('There is no doctor with this name'),
                              ],
                            ),
                          ),
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
