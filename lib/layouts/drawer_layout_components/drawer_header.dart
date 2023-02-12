import 'package:flutter/material.dart';

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
      height: 220,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            height: 76,
            decoration: BoxDecoration(
              // color: pink100ColorEE,
              shape: BoxShape.circle,
            ),
            child: Image(
              image: AssetImage(image),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            email,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}