// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
// import 'dart:math';

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meloristicoutlets/constant/common_functions.dart';
import 'package:meloristicoutlets/views/auth/otp_screen.dart';
import 'package:meloristicoutlets/views/home/homepage.dart';

class AuthController {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthController({
    required this.auth,
    required this.firestore,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            log(e.message.toString());

            throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EnterOTP(
                  // mobileNo: phoneNumber,
                  verificationID: verificationId,
                ),
              ),
            );
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String otp,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      CommonFunctions.showToast(e.message.toString());
    }
  }

  Future signout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(e.toString());
    }
  }
}
