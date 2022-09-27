// ignore_for_file: control_flow_in_finally, no_leading_underscores_for_local_identifiers, unused_element
import 'dart:developer';
// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meloristicoutlets/constant/common_functions.dart';
import 'package:meloristicoutlets/constant/constants.dart';
import 'package:meloristicoutlets/constant/sizedbox.dart';
import 'package:meloristicoutlets/controller/auth_controller/auth_controller.dart';
import 'package:meloristicoutlets/utils/colors.dart';
import 'package:meloristicoutlets/utils/textstyle.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controller/provider/google_sign_in_provider.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  TextEditingController emailAndPhoneController = TextEditingController();
  TextEditingController emailPasswordController = TextEditingController();
  // bool isPhoneNumber = true;
  // String phoneNumber = '';
  // get _phoneNumber => phoneNumber;
  // Check for Numeric or String
  Country? country;
  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  final RegExp _numeric = RegExp(r'^-?[0-9]+$');

  /// check if the string contains only numbers
  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }

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
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        pickCountry();
                      },
                      child: Text(
                        'Pick Country',
                        style: bodyTextWhite18,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 7.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: whiteShade,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 8.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 2, color: whiteShade),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          country != null ? '+${country!.phoneCode}' : '+',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: whiteShade),
                        ),
                      ),
                      SizedBox(
                        width: 64.w,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (v) {
                            log(v.toString());
                          },
                          textAlign: TextAlign.center,
                          controller: emailAndPhoneController,
                          keyboardType: TextInputType.number,
                          cursorColor: white,
                          style: TextStyle(
                            color: white,
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'phone number',
                            hintStyle: TextStyle(
                              color: whiteShade,
                              fontSize: 2.5.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox5h,
                sizedBox5h,
                sizedBox5h,
                sizedBox5h,
                sizedBox5h,
                LoginSignupButton(
                    height: 8.h,
                    width: 40.w,
                    text: 'Login',
                    onTap: () async {
                      if ((country != null) &&
                          (isNumeric(emailAndPhoneController.text.trim()))) {
                        log('both fields are correct');
                        AuthController auth = AuthController(
                            auth: FirebaseAuth.instance,
                            firestore: FirebaseFirestore.instance);
                        log('+${country!.phoneCode}${emailAndPhoneController.text.trim()}');
                        auth.signInWithPhone(context,
                            '+${country!.phoneCode}${emailAndPhoneController.text.trim()}');
                        setState(() {
                          phoneNumber =
                              '+${country!.phoneCode}${emailAndPhoneController.text.trim()}';
                        });
                      } else {
                        if (country == null) {
                          CommonFunctions.showToast(
                              'Opps! you didn\'t selected Phone-Code');
                        } else {
                          CommonFunctions.showToast(
                              'Please enter a valid Phone-Number');
                        }
                        log('fields are not correct');
                      }
                    }),
                sizedBox2h,
                sizedBox5h,
              ],
            )
          ],
        ),
      ),
    );
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
