import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/layouts/drawer_layout_components/cubit/cubit.dart';
import 'package:mobi_care/layouts/drawer_layout_components/cubit/states.dart';

import '../styles/colors.dart';

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
