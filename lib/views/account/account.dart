import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';
import '../../utils/textstyle.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> account = [
      'Profile',
      'Add Social Platforms',
      'Advertise With us',
      'Help',
      'Get Support',
      'Rate',
      'Sign Out'
    ];
    List<IconData> accountIcons = [
      FontAwesomeIcons.person,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.adversal,
      FontAwesomeIcons.question,
      FontAwesomeIcons.phone,
      FontAwesomeIcons.star,
      FontAwesomeIcons.arrowRightFromBracket
    ];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff639DEF), Color(0xffB353C3), Color(0xffB353C3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: SafeArea(
            child: Column(
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
                        // alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 25.w),
                        child: Text('Account', style: appBarTextStyle)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: account.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 9.h,
                        width: 100.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(103, 12, 18, 188),
                                Color.fromARGB(103, 245, 41, 26)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        child: Row(
                          children: [
                            FaIcon(
                              accountIcons[index],
                              // FontAwesomeIcons.linkedin,
                              color: white,
                              size: 35,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              account[index],
                              style: TextStyle(fontSize: 20, color: white),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        )),
      ),
    );
  }
}
