import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meloristicoutlets/constant/constants.dart';
import 'package:meloristicoutlets/constant/sizedbox.dart';
import 'package:meloristicoutlets/controller/auth_controller/auth_controller.dart';
import 'package:meloristicoutlets/utils/colors.dart';
import 'package:meloristicoutlets/utils/textstyle.dart';
import 'package:meloristicoutlets/views/auth/signin_signup.dart';
import 'package:meloristicoutlets/views/auth/widget/login_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class EnterOTP extends StatefulWidget {
  // final String mobileNo;
  final String verificationID;
  const EnterOTP({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  int num = 30;
  bool secOver = false;
  testing() async {
    while (!secOver) {
      await Future.delayed(const Duration(seconds: 1));
      if (num <= 0) {
        setState(() {
          secOver = true;
        });
      } else {
        setState(() {
          num -= 1;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    testing();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    testing();
  }

  @override
  Widget build(BuildContext context) {
    StreamController<ErrorAnimationType> errorController =
        StreamController<ErrorAnimationType>();

    TextEditingController otpController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: 100.h,
        width: 100.w,
        child: ListView(
          children: [
            SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                    width: 100.w,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: FaIcon(
                            FontAwesomeIcons.circleArrowLeft,
                            size: 30,
                            color: whiteShade,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox5h,
                  Text(
                    'Verify Your Mobile number',
                    style: TextStyle(
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  sizedBox1h,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'We have sent you a verification code on\n',
                            style: subHeading.copyWith(color: whiteShade)),
                        TextSpan(
                            text: phoneNumber,
                            style: subHeadingBlack.copyWith(color: whiteShade)),
                      ],
                    ),
                  ),
                  sizedBox3h,
                  SizedBox(
                    width: 90.w,
                    height: 8.h,
                    child: PinCodeTextField(
                      autoFocus: false,
                      appContext: context,
                      hintCharacter: "0",
                      hintStyle: const TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                      pastedTextStyle: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 8.h,
                        fieldWidth: 12.w,
                        activeColor: blue,
                        inactiveColor: white,
                        selectedFillColor: white,
                        activeFillColor: white,
                        selectedColor: white,
                        inactiveFillColor: white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      textStyle: const TextStyle(fontSize: 20, height: 1.6),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        log(v.toString());
                        AuthController auth = AuthController(
                            auth: FirebaseAuth.instance,
                            firestore: FirebaseFirestore.instance);
                        auth.verifyOTP(
                            context: context,
                            verificationId: widget.verificationID,
                            otp: v.toString());
                      },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                  sizedBox2h,
                  Text(
                    '00:$num',
                    style: TextStyle(fontSize: 16, color: white),
                  ),
                  sizedBox1h,
                  Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 16, color: white),
                  ),
                  sizedBox4h,
                  // LoginButton(
                  //   width: 30.w,
                  //   onTap: () {
                  //     log('The OTP is');
                  //     log(otpController.text);

                  //     if (otpController.text.length == 6) {}
                  //   },
                  //   text: 'Log In',
                  // ),
                  sizedBox2h,
                  SizedBox(
                    height: 40.h,
                    width: 100.w,
                    child: const Image(
                        image: AssetImage('assets/images/forgot-password.png'),
                        fit: BoxFit.fitHeight),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
