import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:online_course_clone/theme/color.dart';
import 'package:online_course_clone/utils/onBoardingJson.dart';

import 'rootPage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({ Key? key }) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      onDone: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootPage()));
      },
      key: _introKey,
      globalBackgroundColor: white,
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('Skip', style: TextStyle(color: primary),),
      next: Icon(Icons.arrow_forward, color: primary,),
      done: Text('Done', style: TextStyle(color: primary, fontWeight: FontWeight.bold),),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: DotsDecorator(
        color: hightLightGrey,
        size: Size(10, 10),
        activeColor: primary,
        activeSize: Size(30, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))
        )
      ),
      pages: List.generate(onBoardings.length, (index) {
        return PageViewModel(
          title: onBoardings[index]['title'],
          body: onBoardings[index]['description'],
          image: Image.asset(onBoardings[index]['imageUrl']),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 16, color: grey),
            descriptionPadding: EdgeInsets.all(40)
          ),
        );
      }),
    );
  }
}