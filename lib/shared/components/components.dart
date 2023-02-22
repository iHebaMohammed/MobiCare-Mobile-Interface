import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobi_care/models/user_model.dart';
import 'package:mobi_care/modules/chat_details/chat_details_screen.dart';
import 'package:mobi_care/shared/styles/colors.dart';

void navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}){
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void navigateTo({
  required BuildContext context,
  required Widget widget,
}){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Widget defaultTextFormField
    ({
  required TextEditingController controller,
  required TextInputType keyboardType,
  Function(String value) ? onSubmit,
  required String? Function( String ? value) validation,
  Function(String value) ? onChange,
  required String fieldName,
  IconData ? prefixIcon,
  IconData ? suffixIcon,
  Function() ? onPressedSuffixIcon,
  bool obscureText = false,
  Function() ? onTap,
  int ? maxLines = 1,
  int ? minLines,
  bool isClickable = true,
  double ? redius = 0,
}){
  return TextFormField(
    onTap: onTap,
    enabled: isClickable,
    minLines: minLines,
    maxLines: maxLines,
    obscureText: obscureText,
    controller: controller,
    keyboardType: keyboardType,
    onFieldSubmitted: onSubmit,
    validator: validation,
    onChanged: onChange,
    decoration: InputDecoration(
      labelText: fieldName,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(redius!),
      ),
      prefixIcon: Icon(
          prefixIcon,
      ),
      suffixIcon: IconButton(
        onPressed: onPressedSuffixIcon,
        icon: Icon(
            suffixIcon,
        ),
      ),
    ),
  );
}

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

Widget defaultTextButton ({
  required String text ,
  required Function() function,
  Color textColor = Colors.teal
}){
  return TextButton(
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: textColor,
      ),
    ),
    onPressed: function,
  );
}


void showToast({
  required String text,
  required ToastStates toastStates
}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(toastStates),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates{ SUCCESS , ERROR , WARNING }

Color chooseToastColor(ToastStates toastStates){
  late Color color;
  switch(toastStates){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget drawerHeader({
  required String image,
  required String name,
  required String email,
}){
  return  Container(
    color: primaryColor1BA,
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