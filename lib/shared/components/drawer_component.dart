import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../layouts/patient_drawer_layout_components/cubit/cubit.dart';
import '../../layouts/patient_drawer_layout_components/cubit/states.dart';
import '../styles/colors.dart';
import 'components.dart';

class BuildClickableDrawerItem extends StatelessWidget {

  final String svgIcon;
  final String title;
  final BuildContext context;
  final int index;

  const BuildClickableDrawerItem({
    required this.svgIcon,
    required this.title,
    required this.context,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerLayoutCubit(),
      child: BlocConsumer<DrawerLayoutCubit , DrawerLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocProvider(
            create: (context) => DrawerLayoutCubit(),
            child: BlocConsumer<DrawerLayoutCubit , DrawerLayoutStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                DrawerLayoutCubit cubit = DrawerLayoutCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: InkWell(
                    onTap: (){
                      cubit.changeScreen(index, context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SvgPicture.asset(svgIcon),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: primaryBlackColor,
                                  fontSize: 16
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios , size: 15,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DrawerLayoutHeader extends StatelessWidget {

  final String image;
  final String name;
  final String email;

  const DrawerLayoutHeader({
    required this.image,
    required this.name,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: primaryColor60D_50,
      width: double.infinity,
      height: 240,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultImageShape(
              isMale: false,
              image: image
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            email,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300
            ),
          ),
        ],
      ),
    );
  }
}