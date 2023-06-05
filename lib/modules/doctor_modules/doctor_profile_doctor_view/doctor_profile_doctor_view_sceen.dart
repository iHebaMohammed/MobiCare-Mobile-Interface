import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/shared/components/doctor_image_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorProfileDoctorViewScreen extends StatelessWidget {
  const DoctorProfileDoctorViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor4DC_20,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(35),
                    bottomStart: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 26.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 24),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: primaryWhiteColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                    spreadRadius: 0.05,
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_rounded),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              'Appointment',
                              style: TextStyle(
                                color: primaryBlackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DoctorImageComponent(
                            image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1677180364~exp=1677180964~hmac=322f62b372fd430840916df2f143ee731df2389d1888b370c1725cb50008f371',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Dr. ${asDoctorModel!.data!.fName} ${asDoctorModel!.data!.lName}',
                            style: TextStyle(
                              color: primaryBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${asDoctorModel!.data!.specialization}',
                            style: TextStyle(
                              color: primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/active_star.svg'),
                              SvgPicture.asset('assets/icons/active_star.svg'),
                              SvgPicture.asset('assets/icons/active_star.svg'),
                              SvgPicture.asset('assets/icons/active_star.svg'),
                              SvgPicture.asset('assets/icons/not_active_star.svg'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '4*',
                                style: TextStyle(
                                  color: primaryColor1BA,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '128 Reviews',
                                style: TextStyle(
                                  color: primaryGreyColor808,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryWhiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                          spreadRadius: 0.05,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Patients',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: primaryGreyColor808,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '1267',
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: primaryBlackColor,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryWhiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                          spreadRadius: 0.05,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Experience',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: primaryGreyColor808,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '3yrs',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: primaryBlackColor,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 20
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 28,
                          color: primaryColor1BA,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '${asDoctorModel!.data!.dOB!}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 28,
                          color: primaryColor1BA,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '${asDoctorModel!.data!.address!}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 28,
                          color: primaryColor1BA,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '${asDoctorModel!.data!.email!}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          asDoctorModel!.data!.gender! == 0 ? Icons.female :Icons.male,
                          size: 28,
                          color: primaryColor1BA,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '${asDoctorModel!.data!.gender! == 0 ? 'Female' : 'Male'}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 28,
                          color: primaryColor1BA,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '${asDoctorModel!.data!.phone!}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 24.0 , start: 16 , bottom: 12),                child: Text(
                'About Doctor',
                style: TextStyle(
                    color: primaryBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 26
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  asDoctorModel!.data!.bio != null ? '${asDoctorModel!.data!.bio.toString()}' : 'Write something about you',
                  style: TextStyle(
                    color: primaryBlackColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                  height: 20
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 24.0 , start: 16 , bottom: 12),
                child: Text(
                  'Availability',
                  style: TextStyle(
                      color: primaryBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 26
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColorD2F,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColorD2F,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                child: Text(
                                  '11 : 00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w300,
                                    color: primaryGreyColor808,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColorBBF,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                child: Text(
                                  '14 : 00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w300,
                                    color: primaryGreyColor808,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColorD2F,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                child: Text(
                                  '15 : 00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w300,
                                    color: primaryGreyColor808,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColorD2F,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                child: Text(
                                  '17 : 00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w300,
                                    color: primaryGreyColor808,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
