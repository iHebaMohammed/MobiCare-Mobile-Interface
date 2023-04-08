import 'package:flutter/material.dart';


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({super.key});


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  // onFieldSubmitted: (String value)
                  // {
                  //   print(value);
                  // },
                  decoration: const InputDecoration(
                    labelText : 'Email address',
                    border: OutlineInputBorder() ,
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  // onFieldSubmitted: (String value)
                  // {
                  //   print(value);
                  // },
                  decoration: const InputDecoration(
                    labelText : 'Password',
                    border: OutlineInputBorder() ,
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),

                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child: MaterialButton(onPressed: ()
                  {
                    print(emailController.text);
                    print(passwordController.text);

                  },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Don\'t have an account ?',
                    ),
                    TextButton(
                      onPressed: ()  {},
                      child: Text('Register Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),

        ),
    );
  }
}










// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// //
// // import '../../shared/components/components.dart';
// // import '../../shared/styles/colors.dart';
//
// class DoctorEditProfileScreen extends StatelessWidget {
//   DoctorEditProfileScreen({Key? key}) : super(key: key);
//
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   TextEditingController specialityController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController clinicNameController = TextEditingController();
//   TextEditingController clinicLocationController = TextEditingController();
//   TextEditingController aboutDoctorController = TextEditingController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var primaryColor1BA;
//     var primaryWhiteColor;
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 200,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Align(
//                     alignment: AlignmentDirectional.topCenter,
//                     child: Stack(
//                       alignment: AlignmentDirectional.topEnd,
//                       children: [
//                         Container(
//                           height: 160,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: primaryColor1BA,
//                               borderRadius: BorderRadiusDirectional.only(
//                                 bottomStart: Radius.circular(8),
//                                 bottomEnd: Radius.circular(8),
//                               )
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Stack(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     children: [
//                       SizedBox(
//                         width: 115,
//                         child: defaultImageShape(
//                             isMale: true,
//                             height: 80,
//                             image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1677298982~exp=1677299582~hmac=1adbf7426845a9e3692507cc0f6017fe0df9016d93f502ce163f266f5d4e7d2e'
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: (){
//
//                         },
//                         icon: CircleAvatar(
//                           backgroundColor: primaryColor1BA,
//                           radius: 15,
//                           child: Icon(
//                             Icons.camera_alt,
//                             size: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               child: Text(
//                 'Dr. Ahmed Ali',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             Text(
//               'Allergy and immunology',
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//               style: TextStyle(
//                 fontWeight: FontWeight.w300,
//                 fontSize: 12,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 15),
//               child: Column(
//                 children: [
//                   buildColumnTextField(
//                       controller: firstNameController,
//                       labelName: 'First Name',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'First Name can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: lastNameController,
//                       labelName: 'Last Name',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Last Name can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: emailController,
//                       labelName: 'Email',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Email can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: passwordController,
//                       labelName: 'Password',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Password can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: confirmPasswordController,
//                       labelName: 'Confirm Password',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Confirm Password can\'t be empty';
//                         }else if(value != passwordController.text){
//                           return 'Confirm Password Filed not match Password Filed';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: addressController,
//                       labelName: 'Address',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Address can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: specialityController,
//                       labelName: 'Speciality',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Speciality can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: clinicNameController,
//                       labelName: 'Clinic Name',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Clinic Name can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   buildColumnTextField(
//                       controller: clinicLocationController,
//                       labelName: 'Clinic Location',
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'Clinic Location can\'t be empty';
//                         }
//                         return null;
//                       }
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Text(
//                           'About You'
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       TextFormField(
//                         controller: aboutDoctorController,
//                         maxLines: 6,
//                         decoration: InputDecoration(
//                           fillColor: primaryWhiteColor,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                         ),
//                         validator: (value){
//                           if(value!.isEmpty){
//                             return 'Clinic Location can\'t be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   buildColumnTextField({required TextEditingController controller, required String labelName, required String? Function(dynamic value) validator}) {}
//
//
//   defaultImageShape({required bool isMale, required int height, required String image}) {}
// }