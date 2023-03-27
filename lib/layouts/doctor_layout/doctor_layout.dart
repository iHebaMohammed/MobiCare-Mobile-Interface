import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/search/search_screen.dart';
import '../../shared/components/drawer_component.dart';
import '../../shared/components/navigate_component.dart';
import '../../shared/styles/colors.dart';
import '../drawer_layout_components/drawer_list.dart';
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
                      widget: SearchScreen(),
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
              color: Colors.black12,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 800),
              letIndexChange: (index) => true,
            ),
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerLayoutHeader(
                      image: 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1677116117~exp=1677116717~hmac=0eaee5fcf6754432b852deadbe808bb6b5344e8ef73dc3e38fa9847446bcbcd0',
                      name: 'Heba Adel',
                      email: 'hebaadelahmedmohammed@hmail.com',
                    ),
                    DrawerLayoutList(),
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