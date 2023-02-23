import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';

import '../../shared/styles/colors.dart';

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