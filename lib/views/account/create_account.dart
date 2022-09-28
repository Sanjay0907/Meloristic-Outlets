import 'package:buffer/constants/sized_box.dart';
import 'package:buffer/utils/colors.dart';
import 'package:buffer/views/account/account_created_successful.dart';
import 'package:buffer/views/auth/signin_signup.dart';
import 'package:buffer/views/screens.dart';
// import 'mater';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    TextEditingController phoneController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    TextEditingController confirmPasswordController = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff639DEF),
            Color(0xffB353C3),
            Color(0xffB353C3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: FaIcon(
              FontAwesomeIcons.circleArrowLeft,
              size: 30,
              color: whiteShade,
            ),
          ),
          title: Text(
            'Account',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 6.h,
                width: 100.w,
                alignment: Alignment.center,
                child: Text(
                  'Let\'s get Started',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: whiteShade),
                ),
              ),
              sizedBox1h,
              Text(
                'Signup',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w600, color: white),
              ),
              sizedBox1h,
              TextController(
                usernameController: usernameController,
                hintText: 'Username',
              ),
              TextController(
                usernameController: emailController,
                hintText: 'Email',
              ),
              TextController(
                usernameController: phoneController,
                hintText: 'Phone',
              ),
              TextController(
                usernameController: passwordController,
                hintText: 'Password',
              ),
              TextController(
                usernameController: confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              sizedBox5h,
              Container(
                  width: 100.w,
                  child: Column(
                    children: [
                      LoginSignupButton(
                        height: 6.h,
                        width: 40.w,
                        text: 'Signup',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountCreatedSuccessful(),
                            ),
                          );
                        },
                      ),
                      sizedBox3h,
                      Text(
                        'Already have an account',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                      sizedBox1h,
                      LoginSignupButton(
                        height: 6.h,
                        width: 40.w,
                        text: 'Login',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountCreatedSuccessful(),
                            ),
                          );
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class TextController extends StatelessWidget {
  const TextController(
      {Key? key, required this.usernameController, required this.hintText})
      : super(key: key);

  final TextEditingController usernameController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
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
              onChanged: (v) {},
              textAlign: TextAlign.left,
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: white,
              style: TextStyle(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
