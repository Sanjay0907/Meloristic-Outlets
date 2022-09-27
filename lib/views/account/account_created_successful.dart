import 'package:flutter/material.dart';
import 'package:meloristicoutlets/constant/sizedbox.dart';
import 'package:meloristicoutlets/utils/colors.dart';
import 'package:meloristicoutlets/utils/textstyle.dart';
import 'package:meloristicoutlets/views/screens.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AccountCreatedSuccessful extends StatelessWidget {
  const AccountCreatedSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff639DEF), Color(0xffB353C3), Color(0xffB353C3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Scaffold(
        backgroundColor: transparent,
        body: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              sizedBox5h,
              SizedBox(
                height: 15.h,
                width: 15.h,
                child: const Image(
                  image: AssetImage(
                    'assets/images/companylogo.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              sizedBox3h,
              Text(
                'Meloristic\nOutlets'.toUpperCase(),
                textAlign: TextAlign.center,
                style: headingWhite28,
              ),
              sizedBox3h,
              Text(
                'Account Created Successful !'.toUpperCase(),
                textAlign: TextAlign.center,
                style: headingwhite,
              ),
              sizedBox2h,
              Text(
                'Enjoy posting\nwith us'.toUpperCase(),
                textAlign: TextAlign.center,
                style: headingWhiteShade,
              ),
              sizedBox5h,
              SizedBox(
                height: 20.h,
                width: 80.w,
                child: const Image(
                  image: AssetImage(
                    'assets/images/enjoy.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Enjoy Posting'.toUpperCase(),
                textAlign: TextAlign.center,
                style: headingwhite.copyWith(fontSize: 40),
              ),
              sizedBox5h, sizedBox4h,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screens(),
                    ),
                  );
                },
                child: Container(
                  height: 7.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                  child: Shimmer.fromColors(
                    highlightColor: white,
                    baseColor: whiteShade,
                    child: Text(
                      'Continue   > > >',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.3,
                        color: white,
                      ),
                    ),
                  ),
                ),
              )
              // LoginSignupButton(height: 8.h, text: 'Continue', width: 40.w)
              // SocialLoginButton(text: 'Continue', onTap: (){}, containerColor: , widget: widget, textColor: textColor)
            ],
          ),
        ),
      ),
    );
  }
}
