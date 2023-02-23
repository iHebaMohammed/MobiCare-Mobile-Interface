import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/build_drawer_clicked_item/build_clickable_drawer_item.dart';
import '../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class DrawerLayoutList extends StatelessWidget {
  const DrawerLayoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          BuildClickableDrawerItem(
              index: 0,
              svgIcon: 'assets/drawer_icons/profile.svg',
              title: 'Profile',
              context: context,
          ),
          BuildClickableDrawerItem(
              index: 1,
              svgIcon: 'assets/drawer_icons/prescriptions.svg',
              title: 'Prescription',
              context: context
          ),
          BuildClickableDrawerItem(
              index: 2,
              svgIcon: 'assets/drawer_icons/setting.svg',
              title: 'Settings',
              context: context
          ),
          Divider(
            height: 1.0,
            color: primaryGreyColor808,
          ),
          BuildClickableDrawerItem(
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