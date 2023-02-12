import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/layouts/patient_layout/patient_layout.dart';
import 'package:mobi_care/modules/login/cubit/cubit.dart';
import 'package:mobi_care/modules/login/cubit/states.dart';
import 'package:mobi_care/modules/register/register_screen.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context, state){

        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/shapes/shape_7.svg',
                          width: double.infinity,
                          height: 500,
                          alignment: AlignmentDirectional.topStart,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          defaultTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Email address must be not empty';
                                } else if(!value.contains('@')) {
                                  return 'Email address must have a \'@\' character';
                                }
                                return null;
                              },
                              fieldName: 'Email',
                              prefixIcon: Icons.email_outlined
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Password must be not empty';
                                }
                                return null;
                              },
                              fieldName: 'Password',
                              prefixIcon: Icons.lock_outline,
                              onSubmit: (value){
                                if(formKey.currentState!.validate()){
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              obscureText: cubit.isPassword,
                              suffixIcon: cubit.suffix,
                              onPressedSuffixIcon: (){
                                cubit.changePasswordVisibility();
                              }
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              defaultTextButton(
                                  text: 'Forgot password?',
                                  function: (){},
                                  textColor: primaryColor1BA
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defaultButton(
                                text: 'LOGIN' ,
                                backgroundColor: primaryColor1BA,
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    navigateTo(context: context, widget: PatientLayout());
                                    cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text
                                    );
                                  }
                                }
                            ),
                            fallback: (context)=> Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Don\'t have an account?',
                              ),
                              defaultTextButton(
                                  text: 'Register now',
                                  textColor: primaryColor1BA,
                                  function: (){
                                    navigateTo(
                                        context: context ,
                                        widget: RegisterScreen(),
                                    );
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
