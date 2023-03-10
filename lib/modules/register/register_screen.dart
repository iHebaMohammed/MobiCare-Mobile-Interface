import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/modules/login/login_screen.dart';
import 'package:mobi_care/shared/components/text_button_component.dart';
import 'package:mobi_care/shared/components/text_form_field_component.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigate_component.dart';
import '../../shared/components/toast_component.dart';
import '../../shared/styles/colors.dart';
import 'cubit/states.dart';
import 'cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (context, state){
          if(state is RegisterErrorState){
            showToast(text: state.error.toString(), toastStates: ToastStates.ERROR);
          }else if(state is RegisterErrorFirebaseState){
            showToast(text: state.error.toString(), toastStates: ToastStates.ERROR);
          }
          if(state is RegisterSuccessState){
            navigateTo(context: context, widget: LoginScreen());
          }
          else if(state is CreateUserSuccessFirebaseState){
            navigateTo(context: context, widget: LoginScreen());
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
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
                              'Register',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextFormField(
                              controller: firstNameController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your first name, please';
                                }
                                return null;
                              },
                              fieldName: 'First Name',
                              prefixIcon: Icons.person_outlined
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your last name, please';
                                }
                                return null;
                              },
                              fieldName: 'Last Name',
                              prefixIcon: Icons.person_outlined
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
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
                              fieldName: 'Email Address',
                              prefixIcon: Icons.email_outlined
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
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
                                  cubit.userRegister(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    address: addressController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              obscureText: cubit.isPassword,
                              suffixIcon: cubit.suffix,
                              onPressedSuffixIcon: (){
                                cubit.changePasswordVisibility();
                              },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your phone number, please';
                                }
                                return null;
                              },
                              fieldName: 'Phone Number',
                              prefixIcon: Icons.phone_enabled_outlined,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your address number, please';
                                }
                                return null;
                              },
                              fieldName: 'Address',
                              prefixIcon: Icons.home_outlined,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Optional',
                            style: TextStyle(
                              color: primaryColor1BA,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                            controller: questionController,
                            keyboardType: TextInputType.text,
                            validation: (value){
                              if(value!.isEmpty) {
                                return null;
                              }
                              return null;
                            },
                            fieldName: 'Diseases that you suffer from ?',
                            prefixIcon: Icons.info_outline,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => defaultButton(
                                text: 'Register' ,
                                backgroundColor: primaryColor1BA,
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    cubit.userRegisterByFirebase(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      firstName: firstNameController.text,
                                      phone: phoneController.text,
                                      lastName: lastNameController.text,
                                      address: addressController.text,
                                      diseasesNote: questionController.text,
                                    );
                                  }
                                }
                            ),
                            fallback: (context)=> const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                              ),
                              DefaultTextButton(
                                  text: 'Login',
                                  textColor: primaryColor1BA,
                                  function: (){
                                    navigateTo(
                                        context: context ,
                                        widget: LoginScreen()
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
