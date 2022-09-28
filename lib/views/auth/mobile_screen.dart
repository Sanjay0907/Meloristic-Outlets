// import 'dart:developer';
// import 'package:buffer/constants/firebase.dart';
// import 'package:buffer/constants/sized_box.dart';
// import 'package:buffer/utils/colors.dart';
// import 'package:buffer/utils/text_style.dart';
// import 'package:buffer/views/auth/otp_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sizer/sizer.dart';
// import '../../constants/common_functions.dart';
// import '../../widgets/login_button.dart';

// class LoginPhoneNoScreen extends StatefulWidget {
//   const LoginPhoneNoScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginPhoneNoScreen> createState() => _LoginPhoneNoScreenState();
// }

// class _LoginPhoneNoScreenState extends State<LoginPhoneNoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController phoneNoController = TextEditingController();
//     FirebaseAuth auth = FirebaseAuth.instance;

//     return Scaffold(
//       backgroundColor: black,
//       body: ListView(
//         children: [
//           Container(
//             height: 100.h,
//             width: 100.w,
//             padding: EdgeInsets.symmetric(horizontal: 3.w),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xff639DEF),
//                   Color(0xffB353C3),
//                   Color(0xffB353C3),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 8.h,
//                   width: 100.w,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () => Navigator.pop(context),
//                         icon: FaIcon(
//                           FontAwesomeIcons.circleArrowLeft,
//                           size: 30,
//                           color: whiteShade,
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Forgot Password',
//                             style: headingwhite,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Container(
//                   height: 8.h,
//                   width: 100.w,
//                   decoration: BoxDecoration(
//                       border: Border(
//                     bottom: BorderSide(
//                       color: blueShade1,
//                       width: 1,
//                     ),
//                   )),
//                   child: TextField(
//                     textAlignVertical: TextAlignVertical.center,
//                     onChanged: (v) {
//                       log(v.toString());

//                       phoneNoLength = v.length;
//                     },
//                     textAlign: TextAlign.center,
//                     controller: phoneNoController,
//                     keyboardType: TextInputType.number,
//                     cursorColor: white,
//                     style: TextStyle(
//                       color: white,
//                       fontSize: 4.h,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     decoration: InputDecoration(
//                       border: const UnderlineInputBorder(
//                           borderSide: BorderSide.none),
//                       hintText: 'Enter Your Mobile number',
//                       hintStyle: TextStyle(
//                         color: white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // const Spacer(),
//                 sizedBox5h,
//                 LoginButton(
//                   width: 30.w,
//                   onTap: () {
//                     log(phoneNoLength.toString());
//                     if (phoneNoLength != 10) {
//                       CommonFunctions.showToast('Opps! Invalid Phone No.');
//                     } else {
//                       verifyPhone(phoneNoController.text);
//                     }
//                   },
//                   text: 'Get OTP',
//                 ),
//                 sizedBox5h,
//                 sizedBox5h,

//                 SizedBox(
//                   height: 45.h,
//                   width: 100.w,
//                   child: const Image(
//                       image: AssetImage('assets/images/forgot-password.png'),
//                       fit: BoxFit.cover),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   verifyPhone(String phoneNo) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     await auth.verifyPhoneNumber(
//         phoneNumber: '+91$phoneNo',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           log('You logged in successfully');
//         },
//         verificationFailed: (FirebaseException exception) {
//           log(exception.message.toString());
//         },
//         codeSent: (String verificationID, int? resendToken) {
//           setState(() {
//             verificationIdReceived = verificationID;
//           });
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EnterOTP(
//                 mobileNo: phoneNo,
//               ),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           verificationIdReceived = verificationID;
//         });
//   }
// }
