import 'package:buffer/utils/colors.dart';
import 'package:buffer/views/account/create_account.dart';
import 'package:buffer/views/post_and_feed/posts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<List> aboutCompany = [
      ['assets/images/OriginalImages/art.png', 'Arts & recreation'],
      ['assets/images/OriginalImages/beauty.png', 'Beauty and Personal Care'],
      ['assets/images/OriginalImages/art.png', 'Community and Case'],
      [
        'assets/images/OriginalImages/education.png',
        'Education and Literature'
      ],
      [
        'assets/images/OriginalImages/food and bevrage.png',
        'Food and Beverage'
      ],
      [
        'assets/images/OriginalImages/government.png',
        'Government and Non-Profit'
      ],
      ['assets/images/OriginalImages/fitness.png', 'Health and fitness'],
      ['assets/images/OriginalImages/real-estate.png', 'Home and Real Estate'],
      ['assets/images/OriginalImages/news.png', 'News and Media'],
      ['assets/images/OriginalImages/personal.png', 'Personal and Recreation'],
      ['assets/images/OriginalImages/product.png', 'Product and Services'],
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
            child: ListView(
          children: [
            SizedBox(
              height: 8.h,
              width: 100.w,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Tell us about your Buisness',
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
            // sizedBox3h,
            SizedBox(
              height: 86.h,
              width: 100.w,
              child: ListView.builder(
                  itemCount: aboutCompany.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccount(),
                          ),
                        );
                      },
                      child: Container(
                        height: 10.h,
                        width: 100.w,
                        margin: EdgeInsets.symmetric(
                          vertical: 1.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.h,
                              child: Image(
                                image: AssetImage(aboutCompany[index][0]),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Expanded(
                              child: Container(
                                  child: Text(aboutCompany[index][1],
                                      style: TextStyle(
                                          fontSize: 20, color: black))),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}

class LinkSocialAccount extends StatelessWidget {
  const LinkSocialAccount(
      {Key? key, required this.icon, required this.socialMediaName})
      : super(key: key);
  final String socialMediaName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: blue),
      child: Row(
        children: [
          FaIcon(
            icon,
            size: 30,
            color: whiteShade,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            socialMediaName,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: whiteShade),
          ),
          const Spacer(),
          FaIcon(
            FontAwesomeIcons.plus,
            size: 20,
            color: white,
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
    );
  }
}
