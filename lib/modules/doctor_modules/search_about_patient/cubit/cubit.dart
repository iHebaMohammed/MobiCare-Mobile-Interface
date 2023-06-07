import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class SearchAboutPatientCubit extends Cubit<SearchAboutPatientStates> {

  SearchAboutPatientCubit() : super(SearchAboutPatientInitiateState());

  static SearchAboutPatientCubit get(BuildContext context) => BlocProvider.of(context);

  
}