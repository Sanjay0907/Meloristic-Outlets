import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import 'account/account.dart';
import 'post_and_feed/compose_post.dart';
import 'post_and_feed/feed.dart';
import 'post_and_feed/posts.dart';
import 'scheduler/scheduler.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 2;
  List screens = [
    const Posts(),
    const Scheduler(),
    const ComposePost(),
    const Feeds(),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: whiteShade, width: 1)),
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() => currentIndex = index);
              log(currentIndex.toString());
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: blackShade,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            items: [
              const BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidClock,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(
                    currentIndex == 1
                        ? FontAwesomeIcons.calendarPlus
                        : FontAwesomeIcons.solidCalendarPlus,
                    size: 30,
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 30,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.message,
                  size: 30,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  size: 30,
                ),
                label: '',
              ),
            ],
          ),
        ),
        body: screens[currentIndex]);
  }
}
