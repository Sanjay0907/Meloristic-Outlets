import 'package:buffer/utils/colors.dart';
import 'package:buffer/utils/text_style.dart';
import 'package:buffer/views/account/account.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ScheduledPosts extends StatelessWidget {
  const ScheduledPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: ListView(children: [
          SizedBox(
            height: 8.h,
            width: 100.w,
            child: Row(
              children: [
                // SizedBox(
                //   height: 6.h,
                //   width: 6.h,
                //   child: const Image(
                //     image: AssetImage(
                //       'assets/images/companylogo.png',
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),
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
                    // alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 12.w),
                    child: Text(
                      'Scheduled Posts',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 86.h,
            width: 100.w,
            // color: amber,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: white, width: 1)),
                    margin:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                    child: Column(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        const Spacer(),
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
                              Row(
                                children: [
                                  SizedBox(
                                    height: 4.3.h,
                                    width: 4.3.h,
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/social_logos/like.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  SizedBox(
                                    width: 70.w,
                                    child: Text(
                                      'Hello Followers, I have a great experience to share with you guys',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: bodyTextWhite14,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
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
                                    width: 25.w,
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
                                    width: 58.4.w,
                                    height: 5.h,
                                    child: Text(
                                      'Time left to Post 00:29',
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
                  );
                }),
          )
        ]),
      ),
    );
  }
}
