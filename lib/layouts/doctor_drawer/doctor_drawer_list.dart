import 'package:flutter/material.dart';

import '../../shared/components/drawer_component.dart';
import '../../shared/styles/colors.dart';

class DoctorDrawerLayoutList extends StatelessWidget {
  const DoctorDrawerLayoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          BuildClickableDrawerItemForDoctor(
            index: 0,
            svgIcon: 'assets/drawer_icons/profile.svg',
            title: 'Profile',
            context: context,
          ),
          BuildClickableDrawerItemForDoctor(
              index: 1,
              svgIcon: 'assets/drawer_icons/prescriptions.svg',
              title: 'Add patient to patient list',
              context: context
          ),
          BuildClickableDrawerItemForDoctor(
              index: 2,
              svgIcon: 'assets/drawer_icons/setting.svg',
              title: 'Settings',
              context: context
          ),
          Divider(
            height: 1.0,
            color: primaryGreyColor808,
          ),
          BuildClickableDrawerItemForDoctor(
              index: 3,
              svgIcon: 'assets/drawer_icons/log_out.svg',
              title: 'Log out',
              context: context
          ),
        ],
      ),
    );
  }
}