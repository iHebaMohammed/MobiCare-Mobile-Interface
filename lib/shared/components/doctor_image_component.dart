import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DoctorImageComponent extends StatelessWidget {

  String image;

  DoctorImageComponent({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 105,
          width: 105,
          decoration: BoxDecoration(
            color: primaryWhiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: primaryWhiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
