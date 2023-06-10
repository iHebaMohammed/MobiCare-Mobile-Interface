import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/add_post_screen.dart';
import 'package:mobi_care/modules/doctor_modules/home_visit_requests/home_visit_requests.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';


class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                buildHomeItemContainer(
                  title: 'Home visit',
                  buttonText: 'Book a home visit',
                  function: (){
                    navigateTo(context: context, widget: HomeVisitRequestsScreen());
                  },
                  svgPath: 'assets/svg/patient_home/patient_home_1.svg',
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultPostView(
                  publisherName: 'Heba Adel',
                  publisherImage:
                   'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                  postText:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printe',
                  isImage: true,
                  image: 'assets/image.png',
                  isVideo: false,
                  isLiked: false,
                  numberOfLikes: '25',
                  numberOfComments: '14',
                  dateOfPublish: '14/2/15',
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: InkWell(
              onTap: () {
                navigateTo(context: context, widget: NewPostScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor1BA,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
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
    );
  }

  Widget buildHomeItemContainer({
    required String title,
    required String buttonText,
    required Function() function,
    required String svgPath,
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor60D_10 ,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(title , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DefaultButtonWithCircleAvatar(
                          function: function,
                          text: 'Show Requisites',
                          numberOfRequistes: '3',
                          redius: 20,
                          width: 200,
                          height: 45,
                          fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(svgPath),
            ),
          ],
        ),
      ),
    );
  }
}
