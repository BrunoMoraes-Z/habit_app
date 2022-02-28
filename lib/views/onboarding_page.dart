import 'package:flutter/material.dart';
import 'package:habbit_app/app_styles.dart';
import 'package:habbit_app/main.dart';
import 'package:habbit_app/model/onboard_data.dart';
import 'package:habbit_app/size_config.dart';
import 'package:habbit_app/views/authentication/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/widgets.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnBoard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    setSeenOnboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(height: sizeV * 4),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: sizeV * 4),
                    Container(
                      height: sizeV * 40,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: sizeV * 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: kBodyText1,
                          children: [
                            TextSpan(text: 'WE CAN '),
                            TextSpan(
                              text: 'HELP YOU ',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            TextSpan(text: 'TO BE A BETTER '),
                            TextSpan(text: 'VERSION OF '),
                            TextSpan(
                              text: 'YOURSELF ',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sizeV * 4),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? MyTextButton(
                          text: 'Get Started',
                          backgroundColor: kPrimaryColor,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OnboardingNavButton(
                              name: 'Skip',
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: List.generate(onboardingContents.length,
                                  (index) => dotIndicator(index)),
                            ),
                            OnboardingNavButton(
                              name: 'Next',
                              onClick: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
