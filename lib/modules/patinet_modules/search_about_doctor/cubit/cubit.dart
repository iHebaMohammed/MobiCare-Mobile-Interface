import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class SearchAboutDoctorCubit extends Cubit<SearchAboutDoctorStates> {

  SearchAboutDoctorCubit() : super(SearchAboutDoctorInitiateState());

  static SearchAboutDoctorCubit get(BuildContext context) => BlocProvider.of(context);

  
}