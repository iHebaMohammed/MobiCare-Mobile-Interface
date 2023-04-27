// import 'package:flutter/material.dart';
// import '../add_lists/add_lists_screen.dart';
// import '../add_notes/add_notes_screen.dart';
// import '../login/login_screen.dart';
//
// class EditDoctorProfile extends StatelessWidget {
//   const EditDoctorProfile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             print('back clicked');
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LoginScreen(),
//               ),
//             );
//           },
//         ),
//         title: const Text(
//           'My Profile',
//           style: TextStyle(
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             width: double.infinity,
//             // height: 200.0,
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Stack(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     children: const [
//                       CircleAvatar(
//                         radius: 43.0,
//                         backgroundColor: Color.fromRGBO(77, 198, 225, 1),
//                         child: CircleAvatar(
//                           radius: 40.0,
//                           backgroundImage: AssetImage(
//                             "assets/images/istockphoto-1203995945-612x612.jpg",
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.only(
//                           bottom: 2.0,
//                           end: 2.0,
//                         ),
//                         child: CircleAvatar(
//                           radius: 12.0,
//                           backgroundColor: Color.fromRGBO(77, 198, 225, 1),
//                           child: Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                             size: 15.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     "Ali Mohammed",
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Text(
//                     "AliMohammed@gmail.com",
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Row(
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Edit Profile'),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Icon(
//                         Icons.settings,
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 15.0,
//             width: 300,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 125,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(27, 174, 166, 1),
//                 ),
//                 child: MaterialButton(
//                   onPressed: () {
//                     print('Patients clicked');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EditDoctorProfile(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     'Patients',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 125,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(27, 174, 166, 1),
//                 ),
//                 child: MaterialButton(
//                   onPressed: () {
//                     print('Lists clicked');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddListsScreen(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     'Lists',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 125,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(27, 174, 166, 1),
//                 ),
//                 child: MaterialButton(
//                   onPressed: () {
//                     print('Notes clicked');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddNotesScreen(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     'Notes',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             child: Container(
//               width: 375.0,
//               height: 315.0,
//               decoration: BoxDecoration(
//                 color: Colors.grey[100],
//               ),
//               padding: const EdgeInsets.all(
//                 15.0,
//               ),
//               // margin: const EdgeInsets.all(15.0),
//
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Row(
//                             // alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundColor:
//                                         Color.fromRGBO(77, 198, 225, 1),
//                                     child: CircleAvatar(
//                                       radius: 27.0,
//                                       backgroundImage: AssetImage(
//                                         "assets/images/istockphoto-1203995945-612x612.jpg",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Ali Mohamed',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 50.0,
//                               ),
//                               Container(
//                                 width: 110,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(27, 174, 166, 1),
//                                 ),
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'View Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15.0,
//                           ),
//                           Row(
//                             // alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundColor:
//                                         Color.fromRGBO(77, 198, 225, 1),
//                                     child: CircleAvatar(
//                                       radius: 27.0,
//                                       backgroundImage: AssetImage(
//                                         "assets/images/istockphoto-1203995945-612x612.jpg",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Ali Mohamed',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 50.0,
//                               ),
//                               Container(
//                                 width: 110,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(27, 174, 166, 1),
//                                 ),
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'View Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15.0,
//                           ),
//                           Row(
//                             // alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundColor:
//                                         Color.fromRGBO(77, 198, 225, 1),
//                                     child: CircleAvatar(
//                                       radius: 27.0,
//                                       backgroundImage: AssetImage(
//                                         "assets/images/istockphoto-1203995945-612x612.jpg",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Ali Mohamed',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 50.0,
//                               ),
//                               Container(
//                                 width: 110,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(27, 174, 166, 1),
//                                 ),
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'View Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15.0,
//                           ),
//                           Row(
//                             // alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundColor:
//                                         Color.fromRGBO(77, 198, 225, 1),
//                                     child: CircleAvatar(
//                                       radius: 27.0,
//                                       backgroundImage: AssetImage(
//                                         "assets/images/istockphoto-1203995945-612x612.jpg",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Ali Mohamed',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 50.0,
//                               ),
//                               Container(
//                                 width: 110,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(27, 174, 166, 1),
//                                 ),
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'View Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15.0,
//                           ),
//                           Row(
//                             // alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundColor:
//                                         Color.fromRGBO(77, 198, 225, 1),
//                                     child: CircleAvatar(
//                                       radius: 27.0,
//                                       backgroundImage: AssetImage(
//                                         "assets/images/istockphoto-1203995945-612x612.jpg",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Ali Mohamed',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 50.0,
//                               ),
//                               Container(
//                                 width: 110,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(27, 174, 166, 1),
//                                 ),
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'View Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15.0,
//                           ),
//                           Row(
//                             // alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                               Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundColor:
//                                         Color.fromRGBO(77, 198, 225, 1),
//                                     child: CircleAvatar(
//                                       radius: 27.0,
//                                       backgroundImage: AssetImage(
//                                         "assets/images/istockphoto-1203995945-612x612.jpg",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Ali Mohamed',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 50.0,
//                               ),
//                               Container(
//                                 width: 110,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Color.fromRGBO(27, 174, 166, 1),
//                                 ),
//                                 child: MaterialButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'View Profile',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             width: 210,
//             height: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Color.fromRGBO(27, 174, 166, 1),
//             ),
//             child: MaterialButton(
//               onPressed: () {},
//               child: const Text(
//                 'Add Patient',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
