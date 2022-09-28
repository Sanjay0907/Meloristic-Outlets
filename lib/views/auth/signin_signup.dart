// ignore_for_file: control_flow_in_finally

import 'dart:developer';

import 'package:buffer/constants/firebase.dart';
import 'package:buffer/constants/sized_box.dart';
import 'package:buffer/controller/provider/google_sign_in_provider.dart';
import 'package:buffer/utils/colors.dart';
import 'package:buffer/utils/text_style.dart';
import 'package:buffer/views/auth/otp_screen.dart';
import 'package:buffer/views/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/common_functions.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  TextEditingController emailAndPhoneController = TextEditingController();
  TextEditingController emailPasswordController = TextEditingController();
  bool isPhoneNumber = true;
  // Check for Numeric or String

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff639DEF), Color(0xffB353C3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: 100.h,
        width: 100.w,
        child: ListView(
          children: [
            Column(
              children: [
                sizedBox3h,
                SizedBox(
                  height: 10.h,
                  width: 10.h,
                  child: const Image(
                    image: AssetImage('assets/images/companylogo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                sizedBox2h,
                Text(
                  'Meloristic\nOutlets'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
                sizedBox4h,
                SizedBox(
                  height: 6.h,
                  width: 100.w,
                  child: Text(
                    'Login',
                    style: headingwhite,
                  ),
                ),
                Text(
                  'Fuel your career with mystic Learning\nPortal System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    color: whiteShade,
                  ),
                ),
                sizedBox3h,
                Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: blueShade1,
                      width: 1,
                    ),
                  )),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (v) {
                      bool result =
                          CommonFunctions.isNumericUsingRegularExpression(v);
                      if (result) {
                        setState(() {
                          phoneNoLength = v.length;
                        });
                      }
                      setState(() {
                        isPhoneNumber = result;
                      });
                    },
                    textAlign: TextAlign.left,
                    controller: emailAndPhoneController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: white,
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      hintText: 'Email Address or Mobile number',
                      hintStyle: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                !isPhoneNumber
                    ? Container(
                        height: 8.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: blueShade1,
                            width: 1,
                          ),
                        )),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (v) {},
                          textAlign: TextAlign.left,
                          controller: emailPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          cursorColor: white,
                          style: TextStyle(
                            color: white,
                            fontSize: 4.h,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 8.h,
                        width: 100.w,
                        // color: amber,
                      ),
                sizedBox2h,
                Container(
                  height: 6.h,
                  width: 100.w,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: whiteShade,
                    ),
                  ),
                ),
                sizedBox2h,
                LoginSignupButton(
                  height: 8.h,
                  width: 40.w,
                  text: 'Login',
                  onTap: () async {
                    if (isPhoneNumber) {
                      log(phoneNoLength.toString());
                      if (phoneNoLength != 10) {
                        CommonFunctions.showToast('Opps! Invalid Phone No.');
                      } else {
                        verifyPhone(emailAndPhoneController.text);
                      }
                    } else {
                      if (CommonFunctions.isValidEmail(
                          emailAndPhoneController.text)) {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        try {
                          await auth.createUserWithEmailAndPassword(
                              email: emailAndPhoneController.text.trim(),
                              password: emailPasswordController.text.trim());
                        } catch (e) {
                          if (e.toString() ==
                              '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailAndPhoneController.text.trim(),
                                    password:
                                        emailPasswordController.text.trim());
                          }
                          log(e.toString());
                        }
                      }
                    }
                  },
                ),
                sizedBox2h,
                Text(
                  'Don\'t have an account Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    color: whiteShade,
                  ),
                ),
                sizedBox5h,
                SizedBox(
                  height: 6.h,
                  width: 100.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLoginButton(
                        onTap: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        // imagePath: ,
                        widget: const Image(
                          image: AssetImage(
                              'assets/images/social_logos/google.png'),
                          fit: BoxFit.cover,
                        ),
                        text: 'Google',
                        containerColor: white,
                        textColor: black,
                      ),
                      SocialLoginButton(
                        onTap: () {},
                        widget: FaIcon(
                          FontAwesomeIcons.facebookF,
                          size: 20,
                          color: white,
                        ),
                        text: 'Facebook',
                        containerColor: blue,
                        textColor: white,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  loginFacebook() async {}

  verifyPhone(String phoneNo) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNo',
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('You logged in successfully');
        },
        verificationFailed: (FirebaseException exception) {
          log(exception.message.toString());
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            verificationIdReceived = verificationID;
          });
          // log(verificationIdReceived);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EnterOTP(
                verificationID: verificationID,
                mobileNo: phoneNo,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationIdReceived = verificationID;
        });
  }
}

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({
    required this.height,
    required this.text,
    required this.width,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xffB353C3),
              Color(0xffB353C3),
              Color(0xff639DEF),
            ],
          ),
          border: Border.all(
            color: white,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            height: 1.3,
            color: white,
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.containerColor,
      required this.widget,
      required this.textColor})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color containerColor;
  final Color textColor;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 5.h,
        width: 40.w,
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 4.h,
                child: widget),
            SizedBox(
              width: 5.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16, color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
