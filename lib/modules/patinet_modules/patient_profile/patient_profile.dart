// import 'package:flutter/material.dart';

// class PatientProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: Color(0xFF1BAEA6),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.search,
//               color: Colors.white,
//             ),
//           ),
//         ],
//         centerTitle: true,
//         title: Text(
//           'MobiCare',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       drawer: Drawer(),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 100.0, left: 40, right: 40),
//         child: Container(
//           height: 350,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             color: Color(0xFFC9E8E6),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//                 offset: Offset(0.0, 1.0), //(x,y)
//                 blurRadius: 6.0,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Stack(
//                 alignment: AlignmentDirectional.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 38,
//                     backgroundColor: Color.fromARGB(255, 39, 100, 150),
//                   ),
//                   CircleAvatar(
//                     radius: 35,
//                     backgroundImage: NetworkImage(''),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 7,
//               ),
//               Text(
//                 "Mohammed Ali",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "List 1",
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(
//                 height: 9,
//               ),
//               Text(
//                 "Code:123456",
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [],
//               ),
//               SizedBox(
//                 height: 7,
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       margin: EdgeInsets.only(left: 35),
//                       color: Color(0xFF1BAEA6),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 12),
//                       child: const Text(
//                         'Message',
//                         style: TextStyle(color: Colors.white, fontSize: 15.0),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       margin: EdgeInsets.only(left: 10),
//                       color: Color(0xFF1BAEA6),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 12),
//                       child: const Text(
//                         'Add note',
//                         style: TextStyle(color: Colors.white, fontSize: 15.0),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   OutlinedButton(
//                     child: Text(
//                       "Write prescription",
//                       style: TextStyle(
//                         color: Color(0xFF1BAEA6),
//                       ),
//                     ),
//                     onPressed: () {},
//                   ),
//                   SizedBox(
//                     width: 7,
//                   ),
//                   OutlinedButton(
//                     child: Text(
//                       "Meadical reports",
//                       style: TextStyle(
//                         color: Color(0xFF1BAEA6),
//                       ),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
