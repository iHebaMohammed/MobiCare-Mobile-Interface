import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_drawer/doctor_drawer_list.dart';
import 'package:mobi_care/modules/doctor_modules/search_about_patient/search_about_patient_screen.dart';
import '../../shared/components/drawer_component.dart';
import '../../shared/components/navigate_component.dart';
import '../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class DoctorLayout extends StatelessWidget {
  DoctorLayout({Key? key}) : super(key: key);

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorLayoutCubit(),
      child: BlocConsumer<DoctorLayoutCubit , DoctorLayoutStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          DoctorLayoutCubit cubit = DoctorLayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: primaryColor1BA,
              actions: [
                IconButton(
                  onPressed: (){
                    navigateTo(
                      context: context,
                      widget: SearchAboutPatientScreen(),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: primaryWhiteColor,
                  ),
                ),
              ],
              centerTitle: true,
              title: Text(
                'MobiCare',
                style: TextStyle(
                    color: primaryWhiteColor
                ),
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              items: cubit.bottomNavIcons,
              buttonBackgroundColor: primaryColor1BA,
              height: 60.0,
              onTap: (index) {
                cubit.changeBottomIndex(index);
              },
              index: cubit.currentIndex,
              color: primaryColorD2F_40,
              backgroundColor: primaryWhiteColor,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              letIndexChange: (index) => true,
            ),
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DoctorDrawerLayoutHeader(
                      image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1682593217~exp=1682593817~hmac=e0cc3f61d6942cdbba91d78d525a722cbac431d92f4facb3116299efa079353f',
                      name: 'Mohammed Ahmed',
                      email: 'mohammedahmed@hmail.com',
                    ),
                    DoctorDrawerLayoutList(),
                  ],
                ),
              ),
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}