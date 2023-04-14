abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingFirebaseState extends LoginStates {}

class LoginSuccessFirebaseState extends LoginStates {
  final String uId;
  LoginSuccessFirebaseState({
    required this.uId,
  });
}

class LoginErrorFirebaseState extends LoginStates {
  final String error;

  LoginErrorFirebaseState({
    required this.error,
  });
}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String token;
  LoginSuccessState({
    required this.token,
  });
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({
    required this.error,
  });

}

class LoginChangePasswordVisibility extends LoginStates {}

class AdminLoginLoadingState extends LoginStates{}

class AdminLoginSuccessfullyState extends LoginStates{}

class AdminLoginErrorState extends LoginStates{

  final String error;

  AdminLoginErrorState({
    required this.error,
  });
}