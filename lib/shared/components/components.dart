import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobi_care/models/user_model.dart';
import 'package:mobi_care/modules/chat_details/chat_details_screen.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import 'navigate_component.dart';


Widget defaultButton
    ({
  double width = double.infinity ,
  Color backgroundColor = Colors.teal ,
  double redius = 0.0,
  required Function() function ,
  required String text ,
  double height = 52,
  double fontSize = 15,
}){
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(redius),
    ),
    width: width,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
            fontSize: fontSize
        ),
      ),
    ),
  );
}


Widget medicationReminderContainer({
  required String name,
  required String timeInHour,
  required String timeInMinute,
  required bool isTimeAM,
  required howTimes,
}){
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: primaryColor1BA,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: primaryWhiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 21,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      timeInHour,
                      style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 34,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      ':$timeInMinute',
                      style: TextStyle(
                        color: primaryWhiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if(isTimeAM)
                      Text(
                        'AM',
                        style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    else
                      Text(
                        'PM',
                        style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                  ],
                ),
                Text(
                  howTimes,
                  style: TextStyle(
                    color: primaryWhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defaultImageShape({
  required bool isMale,
  required String image,
  double height = 70
}){
  if(isMale)
    return CircleAvatar(
      backgroundColor: primaryMaleColor,
      radius: height/2 + 4,
      child: Container(
      height: height,
      decoration: BoxDecoration(
        color: primaryMaleColor,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image(
        image: NetworkImage(image!),
        width: height,
        height: height,
        fit: BoxFit.cover,
      ),
  ),
    );
  else
    return CircleAvatar(
      backgroundColor: primaryFemaleColor,
      radius: height/2 + 4,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: primaryMaleColor,
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.antiAlias,
        child: Image(
          image: NetworkImage(image),
          width: height,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
}

Widget defaultPostView({
  required String publisherName,
  required String publisherImage,
  required String postText,
  required bool isImage,
  String ? image,
  required bool isVideo,
  String ? video,
  required bool isLiked,
  required String numberOfLikes,
  required String numberOfComments,
  required String dateOfPublish,
}){
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultImageShape(isMale: false, image: publisherImage , height: 40),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  publisherName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              postText,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          if(isImage)
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image(
              image: AssetImage(
                  'assets/image.png'
              ),
            ),
          ),
          Divider(),
          Row(
            children: [
              if(isLiked)
                IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.favorite,
                  color: primaryLikeColor,
                ),
              ),
              if(!isLiked)
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.favorite_border,
                    color: primaryLikeColor,
                  ),
                ),
              Text(
                '$numberOfLikes Likes',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.comment_outlined,
                ),
              ),
              Text(
                '$numberOfComments comments',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                ),
              ),
              Spacer(),
              Text(
                dateOfPublish,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget defaultChatRowUserViewItem({
  required String lastMessage,
  required String dateOfLastMassage,
  required String numberOfMessage,
  required BuildContext context,
  required UserModel model,
}){
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: InkWell(
      onTap: (){
        navigateTo(
            context: context,
            widget: ChatDetailsScreen(userModel: model),
        );
      },
      child: Row(
        children: [
          defaultImageShape(
            isMale: model.isMale!,
            image: model.imageUrl! ,
            height: 60,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.firstName} ${model.lastName}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    lastMessage,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Spacer(),
          Column(
            children: [
              Text(
                dateOfLastMassage,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: primaryColor1BA,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor1BA,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 4.0),
                  child: Text(
                    numberOfMessage,
                    style: TextStyle(
                        color: primaryWhiteColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget defaultSearchRowUserViewItem({
  required bool isMale,
  required String image,
  required String name,
  required bool isDoctor,
}){
  return Padding(
    padding: const EdgeInsets.only(top: 14.0),
    child: Row(
      children: [
        defaultImageShape(
          isMale: isMale,
          image: image,
          height: 55,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Spacer(),
        if(isDoctor)
          Text(
          'Doctor',
          style: TextStyle(
              fontSize: 18,
              color: primaryGreyColor808,
              fontWeight: FontWeight.w500
          ),
        ),
        if(!isDoctor)
          Text(
            'Clinic',
            style: TextStyle(
                fontSize: 18,
                color: primaryGreyColor808,
                fontWeight: FontWeight.w500
            ),
          ),
      ],
    ),
  );
}

Widget defaultTextFormFieldWithoutBorder({
  required TextEditingController controller,
  double radius = 10,

}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: primaryGreyColorD9D_50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),

      ),
    ),
  );
}

Widget buildPrescriptionItem({
  required String dateTime ,
  required String doctorName,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        color: primaryWhiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: primaryColor1BA.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 15.0),
        child: InkWell(
          onTap: (){

          },
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/pdf_icon.svg',
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                dateTime,
                style: TextStyle(
                  color: primaryGreyColor808,
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  doctorName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: primaryBlueColor529,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget defaultSettingItem({
  required IconData icon,
  required String labelName,
  required Widget widget,
}){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: primaryWhiteColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor1BA.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: primaryBlackColor_60,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            labelName,
            style: TextStyle(
              fontSize: 16,
              color: primaryBlackColor_60,
            ),
          ),
          Spacer(),
          widget,
        ],
      ),
    ),
  );
}

Widget defaultFollowUpWithItem({
  required bool isMale,
  required String image,
  required String name,
  required String specialization,
}){
  return SizedBox(
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 15.0 , end: 15.0 , top: 10.0),
      child: Row(
        children: [
          defaultImageShape(
            isMale: isMale,
            image: image,
            height: 50,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  specialization,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: (){

            },
            icon: SvgPicture.asset(
                'assets/bottom_nav_icons/chat_not_active.svg'
            ),
          ),
        ],
      ),
    ),
  );
}

Widget defaultSymptomItem({
  required String nameOfSymptom,
}){
  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 8.0 , bottom: 10),
    child: Container(
      decoration: BoxDecoration(
          color: primaryColor1BA.withOpacity(0.3),
          borderRadius: BorderRadiusDirectional.circular(15.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
        child: Text(
          nameOfSymptom ,
          style: TextStyle(
            // fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
        ),
      ),
    ),
  );
}

Widget buildColumnTextField({
  required TextEditingController controller,
  required String ? labelName,
  required String? Function( String ? value) validator,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 12,
      ),
      Text(
          '$labelName'
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: primaryWhiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        validator: validator,
      ),
    ],
  );
}

Widget defaultSymptomWithRemoveItem({
  required String nameOfSymptom,
}){
  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 8.0 , bottom: 10),
    child: Container(
      decoration: BoxDecoration(
          color: primaryColor1BA.withOpacity(0.3),
          borderRadius: BorderRadiusDirectional.circular(25.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Stomach pain' ,
              style: TextStyle(
                // fontWeight: FontWeight.w300,
                fontSize: 13,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.close,
              size: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defaultCommentShape({
  required String image,
  required String name,
  required bool isMale,
  required String textOfComment,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        color: primaryGreyColorD9D_50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultImageShape(
              isMale: isMale,
              height: 35,
              image: image
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    textOfComment,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}