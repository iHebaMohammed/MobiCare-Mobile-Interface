import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/payment/cubit/status.dart';

class PaymentCubit extends Cubit<PaymentStates> {

  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(BuildContext context) => BlocProvider.of(context);

  bool isChecked = false;

  void changeRadioBottom(bool value){
    isChecked = !isChecked;
    emit(PaymentChangeCustomRadioBottomState());
  }
}