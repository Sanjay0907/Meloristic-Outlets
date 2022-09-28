import 'package:buffer/constants/common_functions.dart';
import 'package:buffer/utils/colors.dart';
import 'package:buffer/utils/text_style.dart';
import 'package:buffer/views/post_and_feed/schedule_for_later.dart';
import 'package:buffer/views/post_and_feed/scheduled_post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Scheduler extends StatelessWidget {
  const Scheduler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> options = [
      ['Schedled', 'Posts'],
      ['Saved for', 'Later'],
    ];
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: 100.h,
      width: 100.w,
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
                        child: Text('Scheduler', style: appBarTextStyle),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ScheduledPosts()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ScheduledPostsLater()));
                        }
                      },
                      child: Container(
                        height: 37.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: whiteShade, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        // color: amber,
                        margin: EdgeInsets.symmetric(
                          vertical: 1.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  options[index][0],
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                  width: 30.w,
                                  child: Divider(
                                    color: whiteShade,
                                    height: 20,
                                    thickness: 2,
                                  ),
                                ),
                                Text(
                                  options[index][1],
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            FaIcon(
                              FontAwesomeIcons.angleRight,
                              size: 25,
                              color: white,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
