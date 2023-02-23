import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/drawer_layout_components/drawer_header.dart';
import 'package:mobi_care/layouts/drawer_layout_components/drawer_list.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import '../../modules/search/search_screen.dart';
import '/shared/styles/colors.dart';
import '../../shared/components/components.dart';

class PatientLayout extends StatelessWidget {
  PatientLayout({Key? key}) : super(key: key);

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientLayoutCubit(),
      child: BlocConsumer<PatientLayoutCubit , PatientLayoutStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          PatientLayoutCubit cubit = PatientLayoutCubit.get(context);
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
                        image: 'assets/user.png',
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
