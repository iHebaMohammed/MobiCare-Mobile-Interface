abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState({required this.error});
}

class RegisterLoadingFirebaseState extends RegisterStates {}

class RegisterSuccessFirebaseState extends RegisterStates {}

class RegisterErrorFirebaseState extends RegisterStates {
  final String error;
  RegisterErrorFirebaseState({required this.error});
}

class CreateUserLoadingFirebaseState extends RegisterStates {}

class CreateUserSuccessFirebaseState extends RegisterStates {}

class CreateUserErrorFirebaseState extends RegisterStates {
  final String error;
  CreateUserErrorFirebaseState({required this.error});
}

class RegisterChangePasswordVisibility extends RegisterStates {}