import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor60D_10 ,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20 , top: 10 , bottom: 10),
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Home Visit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Spacer(),
                                  MaterialButton(
                                    color: primaryColor1BA,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    onPressed: (){},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'See Requests',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: primaryEmergencyColor,
                                            radius: 10,
                                            child: Text(
                                              '5',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                              'assets/svg/patient_home/patient_home_1.svg',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultPostView(
                      publisherName: 'Heba Adel',
                      publisherImage: 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1677116117~exp=1677116717~hmac=0eaee5fcf6754432b852deadbe808bb6b5344e8ef73dc3e38fa9847446bcbcd0',
                      postText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printe',
                      isImage: true,
                      image: 'assets/image.png',
                      isVideo: false,
                      isLiked: false,
                      numberOfLikes: '25',
                      numberOfComments: '14' ,
                      dateOfPublish: '14/2/15',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor1BA,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0 , horizontal: 20),
                      child: Text(
                        'Add new video',
                        style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
