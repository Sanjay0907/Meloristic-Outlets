import 'package:buffer/utils/colors.dart';
import 'package:buffer/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ComposePost extends StatelessWidget {
  const ComposePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: transparent,
          body: Column(
            children: [
              SizedBox(
                height: 8.h,
                width: 100.w,
                child: Row(
                  children: [
                    SizedBox(
                      height: 6.h,
                      width: 6.h,
                      child: const Image(
                        image: AssetImage(
                          'assets/images/companylogo.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 22.w),
                        child: Text('Compose', style: appBarTextStyle),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  // color: amber,
                  height: 78.h,
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: white, width: 1)),
                        margin: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 5.w),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 6.h,
                              width: 100.w,
                              padding: EdgeInsets.symmetric(vertical: 0.5.h),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 4.3.h,
                                    width: 4.3.h,
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/social_logos/twitter.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.3.h,
                                    width: 4.3.h,
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/social_logos/insta.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.3.h,
                                    width: 4.3.h,
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/social_logos/fb.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.3.h,
                                    width: 4.3.h,
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/social_logos/pintrest.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.3.h,
                                    width: 4.3.h,
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/social_logos/linkedin.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 23.7.h,
                              width: 100.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Click to Add',
                                    style: headingWhite28.copyWith(
                                        color: whiteShade),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 10.h,
                                    color: whiteShade,
                                  ),
                                  Text(
                                    'Photo or Video',
                                    style: headingWhite28.copyWith(
                                        color: whiteShade),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 10.h,
                              width: 100.w,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffB353C3),
                                    Color(0xffB353C3),
                                    Color(0xff639DEF),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 100.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Click to add Caption',
                                      style: bodyTextWhite14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(color: white),
                                            top: BorderSide(color: white),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        width: 27.45.w,
                                        height: 5.h,
                                        child: Text(
                                          'Post Now',
                                          style: bodyTextWhite18,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(color: white),
                                            top: BorderSide(color: white),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        width: 28.w,
                                        height: 5.h,
                                        child: Text(
                                          'Saved',
                                          style: bodyTextWhite18,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(color: white),
                                            top: BorderSide(color: white),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        width: 28.w,
                                        height: 5.h,
                                        child: Text(
                                          'Schedule',
                                          style: bodyTextWhite18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
