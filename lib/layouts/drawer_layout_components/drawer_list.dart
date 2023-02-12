import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/build_clickable_drawer_item.dart';
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
              context: context
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


// Widget MyDrawerList(){
//   return Container(
//     padding: EdgeInsets.only(top: 15),
//     child: Column(
//       children: [
//         menuItems(1 , 'Profile' , SvgPicture.asset('assets/svgs/person_fill.svg') , currentPage == DrawerSections.profile? true : false ),
//         menuItems(2 , 'Language' , SvgPicture.asset('assets/svgs/globe.svg') , currentPage == DrawerSections.language? true : false),
//         menuItems(3 , 'Payment' , SvgPicture.asset('assets/svgs/credit_card_2_front_fill.svg') , currentPage == DrawerSections.payment? true : false),
//         menuItems(4 , 'Emergency Contacts' , SvgPicture.asset('assets/svgs/telephone_fill.svg') , currentPage == DrawerSections.emergencyContacts? true : false),
//         menuItems(5 , 'Prescriptions' , SvgPicture.asset('assets/svgs/prescription.svg') , currentPage == DrawerSections.prescriptions? true : false),
//         menuItems(6 , 'Symptoms' , SvgPicture.asset('assets/svgs/capsule-pill.svg') , currentPage == DrawerSections.symptoms? true : false),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Container(
//             color: black010Color00,
//             height: 1, width: double.infinity,
//           ),
//         ),
//         menuItems(7 , 'Log out' , SvgPicture.asset('assets/svgs/box_arrow_right.svg') , currentPage == DrawerSections.logOut? true : false),
//       ],
//     ),
//   );
// }



// Widget menuItems(int id , String title , Widget icon , bool selected){
//   return Material(
//     child: InkWell(
//       onTap: (){
//         setState(() {
//           if(id == 1){
//             currentPage = DrawerSections.profile;
//             Navigator.push(
//                 context , MaterialPageRoute(
//                 builder: (context) => EditProfile()
//             )
//             );
//           }else if(id == 2) {
//             currentPage = DrawerSections.language;
//             Navigator.push(
//                 context , MaterialPageRoute(
//                 builder: (context) => LanguageScreen()
//             )
//             );
//           }else if(id == 3) {
//             currentPage = DrawerSections.payment;
//           }else if(id == 4) {
//             currentPage = DrawerSections.emergencyContacts;
//           }else if(id == 5) {
//             currentPage = DrawerSections.prescriptions;
//           }else if(id == 6) {
//             currentPage = DrawerSections.symptoms;
//           }else if(id == 7) {
//             currentPage = DrawerSections.logOut;
//           }else if(id == 0) {
//             currentPage = DrawerSections.home;
//           }
//         });
//       },
//       // child: Padding(
//       //   padding: EdgeInsets.all(15),
//       //   child: Row(
//       //     children: [
//       //       Expanded(
//       //         child: icon,
//       //       ),
//       //       Expanded(
//       //         flex: 4,
//       //         child: Text(
//       //           title,
//       //           style: TextStyle(
//       //               color: black100Color00,
//       //               fontSize: 16
//       //           ),
//       //         ),
//       //       ),
//       //       Expanded(
//       //         child: Icon(Icons.arrow_forward_ios , size: 15,),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     ),
//   );
// }




