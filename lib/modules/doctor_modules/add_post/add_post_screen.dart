import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/cubit/states.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import '../../../shared/styles/colors.dart';
import 'cubit/cubit.dart';


class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);

  TextEditingController postController = TextEditingController();
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit , AddPostStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor1BA,
              actions: [
                TextButton(onPressed: (){
                  if(AddPostCubit.get(context).postImage == null){
                    AddPostCubit.get(context).createPost(
                      datetime: now.toString(),
                      text: postController.text,
                    );
                  }else{
                    AddPostCubit.get(context).uploadPostImage(
                      datetime: now.toString(),
                      text: postController.text,
                    );
                  }
                }, child: Text('POST' , style: TextStyle(color: primaryWhiteColor),))
              ],
              title: Text('New post' , style: TextStyle(color: primaryWhiteColor),),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if(state is CreatePostSuccessState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                        ),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${asDoctorModel!.data!.fName} ${asDoctorModel!.data!.lName}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Public',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: postController,
                      decoration: InputDecoration(
                          hintText: 'What is on your mind?',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if(AddPostCubit.get(context).postImage != null)
                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: FileImage(
                                    AddPostCubit.get(context).postImage!
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              AddPostCubit.get(context).removePostImage();
                            },
                            icon: CircleAvatar(
                              radius: 20,
                              child: Icon(
                                  Icons.close
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if(AddPostCubit.get(context).postImage != null)
                    SizedBox(
                      height: 20,
                    ),
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        AddPostCubit.get(context).getPostImage();
                      }, child: Row(
                        children: [
                          Icon(Icons.image),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Add Photo')
                        ],
                      ),
                      ),
                      Spacer(),
                      Expanded(
                        child: TextButton(onPressed: (){}, child: Text('# Tags'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
}