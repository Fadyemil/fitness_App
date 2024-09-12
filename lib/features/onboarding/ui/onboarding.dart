import 'dart:developer';

import 'package:fitness_app/core/widget/big_text.dart';
import 'package:fitness_app/core/widget/small_text.dart';
import 'package:fitness_app/features/login/ui/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      log(_currentIndex.toString());
    });
  }

  void _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _nextPage() {
    if (_currentIndex < 3) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      _completeOnboarding();
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              _buildOnboardingPage(
                title: "Track Your Goal",
                description:
                    "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
                image: 'assets/SVG/Vector(0).svg',
              ),
              _buildOnboardingPage(
                title: "Get Burn",
                description:
                    "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
                image: 'assets/SVG/Vector(1).svg',
              ),
              _buildOnboardingPage(
                title: "Eat Well",
                description:
                    "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
                image: 'assets/SVG/Vector(2).svg',
              ),
              _buildOnboardingPage(
                title: "Improve Sleep  Quality",
                description:
                    "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
                isLastPage: true,
                image: 'assets/SVG/Vector(3).svg',
              ),
            ],
          ),
          if (_currentIndex > 0 && _currentIndex != 3)
            Positioned(
              bottom: 20,
              left: 20,
              child: FloatingActionButton(
                onPressed: _previousPage,
                backgroundColor: Color(0xff99BEFE),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          if (_currentIndex <= 2)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _nextPage,
                backgroundColor: Color(0xff99BEFE),
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          if (_currentIndex == 3)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 315.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: const Color(0xff92A3FD),
                    borderRadius: BorderRadius.circular(45.r)),
                child: const Center(
                  child: Text(
                    'Go To Register',
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 80,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                type: WormType.thin,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String title,
    required String description,
    required String image,
    bool isLastPage = false,
  }) {
    return SingleChildScrollView(
      child: Container(
        height: 812.h,
        // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
              ),
              height: 375.h,
              width: double.infinity,
              child: SvgPicture.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  BigText(data: title),
                  const SizedBox(height: 15),
                  SmallText(
                    data: description,
                    size: 14,
                    isOverflow: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
