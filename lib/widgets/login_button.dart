import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key, required this.onTap, required this.text, required this.width})
      : super(key: key);
  final VoidCallback onTap;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 7.h,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        margin: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: white,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: black,
            fontSize: 16,
            // fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
