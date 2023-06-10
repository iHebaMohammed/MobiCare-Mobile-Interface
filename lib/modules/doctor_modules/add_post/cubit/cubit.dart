import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobi_care/models/video_model.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mobi_care/shared/constants/constants.dart';

class AddPostCubit extends Cubit<AddPostStates> {

  AddPostCubit() : super(AddPostInitialState());

  static AddPostCubit get(BuildContext context) => BlocProvider.of(context);

  void removePostImage(){
    postImage = null;
    emit(RemovePostImageState());
  }


  var picker = ImagePicker();

  File ? postImage;

  Future getPostImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      postImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(PostImagePickedSuccessState());
    }else{
      print('No Image Picked');
      emit(PostImagePickedErrorState());
    }
  }


  void uploadPostImage({
    required String datetime,
    required String text,
  }){
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value){
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(datetime: datetime, text: text, postImage: value);
      }).catchError((error){
        emit(PostImagePickedErrorState());
      });
    }).catchError((error){
      emit(PostImagePickedErrorState());
    });
  }

  void createPost({
    required String datetime,
    required String text,
    String ? postImage
  }){
    emit(CreatePostLoadingState());
    VideoModel model = VideoModel(
        firstName: asDoctorModel!.data!.fName,
        lastName: asDoctorModel!.data!.lName,
        isMale: asDoctorModel!.data!.gender == 0 ? false : true,
        dateTime: datetime,
        caption: text,
        dUId: asDoctorModel!.data!.fUID,
        imageUrl: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
        video: postImage ?? ""
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error){
      emit(CreatePostErrorState());
    });
  }
}