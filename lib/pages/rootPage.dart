import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_clone/pages/accountPage.dart';
import 'package:online_course_clone/pages/chatPage.dart';
import 'package:online_course_clone/pages/homePage.dart';
import 'package:online_course_clone/pages/coursePage.dart';
import 'package:online_course_clone/pages/searchPage.dart';
import 'package:online_course_clone/theme/color.dart';
import 'package:online_course_clone/utils/constant.dart';

class RootPage extends StatefulWidget {

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: selectedIndex == 0 ? getAppBar() : null,
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 25,
                onPressed: () {}, 
                icon: SvgPicture.asset("assets/images/menu.svg", height: 24,),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(profileUrl),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary,
                        border: Border.all(width: 1.5, color: white)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: selectedIndex,
      children: [
        HomePage(),
        SearchPage(),
        CoursePage(),
        ChatPage(),
        AccountPage()
      ],
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: white,
        boxShadow: [
          BoxShadow(
            color: hightLightGrey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3)
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            }, 
            icon: selectedIndex == 0 
            ? SvgPicture.asset("assets/images/home_active.svg", height: 20, color: primary,)
            : SvgPicture.asset("assets/images/home_inactive.svg", height: 20,)
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            }, 
            icon: selectedIndex == 1 
            ? SvgPicture.asset("assets/images/search_active.svg", height: 20, color: primary,)
            : SvgPicture.asset("assets/images/search_inactive.svg", height: 20,)
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            }, 
            icon: selectedIndex == 2 
            ? SvgPicture.asset("assets/images/play_active.svg", height: 20, color: primary,)
            : SvgPicture.asset("assets/images/play_inactive.svg", height: 20,)
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 3;
              });
            }, 
            icon: selectedIndex == 3 
            ? SvgPicture.asset("assets/images/chat_active.svg", height: 20, color: primary,)
            : SvgPicture.asset("assets/images/chat_inactive.svg", height: 20,)
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 4;
              });
            }, 
            icon: selectedIndex == 4 
            ? SvgPicture.asset("assets/images/user_active.svg", height: 20, color: primary,)
            : SvgPicture.asset("assets/images/user_inactive.svg", height: 20,)
          ),
        ],
      ),
    );
  }
}