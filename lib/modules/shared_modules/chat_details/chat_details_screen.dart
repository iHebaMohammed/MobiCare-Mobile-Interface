import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/user_model.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChatDetailsScreen extends StatelessWidget {

  TextEditingController messageController = TextEditingController();
  final UserModel userModel;
  ChatDetailsScreen({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ChatMessagesCubit.get(context).getMessages(receiverId: userModel.uId!);
        return BlocConsumer<ChatMessagesCubit , ChatMessagesStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            ChatMessagesCubit cubit = ChatMessagesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor1BA,
                title: Row(
                  children: [
                    DefaultImageShape(
                        isMale: userModel.isMale!,
                        image: userModel.imageUrl!,
                        height: 40
                    ),
                    Expanded(
                      child: Text(
                        '${userModel.firstName} ${userModel.lastName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primaryWhiteColor
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.call_outlined))
                ],
              ),
              body: Column(
                children: [
                  ConditionalBuilder(
                    condition: cubit.messages.length > 0,
                    builder: (context) =>  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if(uId == cubit.messages[index].senderId){
                                return buildMyMessage(cubit.messages[index].messageText);
                              }else{
                                return buildMessage(cubit.messages[index].messageText);
                              }
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 15,),
                            itemCount: cubit.messages.length
                        ),
                      ),
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                  if(cubit.messages.length == 0)
                    Spacer(),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryColor1BA,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Message..',
                                  fillColor: primaryWhiteColor,
                                  filled: true
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 49,
                          color: primaryColor1BA,
                          child: MaterialButton(
                            minWidth: 1,
                            onPressed: (){
                              cubit.sendMessage(
                                receiverId: userModel.uId!,
                                dateTime: DateTime.now().toString(),
                                  messageText: messageController.text,
                              );
                              messageController.text = '';
                            },
                            child: Icon(
                              Icons.send_outlined,
                              color: primaryWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            );
          },
        );
      }
    );
  }

  Widget buildMessage(String message){
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor1BA.withOpacity(0.20),
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomEnd: Radius.circular(10.0)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMyMessage(String message){
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor1BA.withOpacity(0.70),
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomStart: Radius.circular(10.0)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
