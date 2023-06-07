import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/states.dart';
import 'package:mobi_care/modules/shared_modules/payment_done/payment_done_screen.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/components/patient_component_in_patients_list.dart';
import '../patient_profile_doctor_view/patient_profile_doctor_view_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart' as bloc;



class DoctorPatientsListScreen extends StatelessWidget {
  const DoctorPatientsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorPatientListCubit , bloc.DoctorPatientListStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        DoctorPatientListCubit cubit = DoctorPatientListCubit.get(context);
        return ConditionalBuilder(
          condition: state is bloc.GetDoctorPatientListSuccessfullyState,
          builder: (context) => Padding(
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
                  itemCount: cubit.doctorPatientListModel!.data!.length,
                  itemBuilder: (context, index) => PatientComponentInPatientsList(
                    image: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                    isMale: cubit.doctorPatientListModel!.data![index].gender == 0 ? false : true,
                    function: (){
                      // cubit.getSymptoms(id: cubit.doctorPatientListModel!.data![index].patientID!).then((value) {
                      //   print(cubit.symptoms);
                      //   if(state is bloc.GetSymptomsSuccessfullyState)
                          navigateTo(context: context, widget: PatientProfileDoctorViewScreen(
                            data: cubit.doctorPatientListModel!.data![index] ,
                            // symptomsModel: cubit.symptoms!,
                          ));
                          // navigateTo(context: context, widget: PaymentDoneScreen());
                    //   });
                    },
                    name: '${cubit.doctorPatientListModel!.data![index].fName} ${cubit.doctorPatientListModel!.data![index].lName}',
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
