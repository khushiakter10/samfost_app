

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/features/onbording/widget/onbordingone.dart';
import 'package:samfost_app/features/onbording/widget/onbordingthree.dart';
import 'package:samfost_app/features/onbording/widget/onbordingtwo.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final p = _pageController.page;
      if (p != null) {
        final rounded = p.round();
        if (rounded != _currentPageIndex) {
          setState(() {
            _currentPageIndex = rounded;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    NavigationService.navigateTo(Routes.loginScreen);
  }

  void _goToNextPage() {
    if (_currentPageIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingOneScreen(
                onNext: _goToNextPage,
                onJumpToLast: () {
                  _pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              OnboardingPageTwoContent(
                onBack: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                onNext: _goToNextPage,
                onJumpToLast: () {
                  _pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              OnboardingPageThreeContent(
                onStart: _goToLogin,
              ),
            ],
          ),

          // ✅ Page 1 Send icon
          if (_currentPageIndex == 0)
            Positioned(
              bottom: 24.h,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _goToNextPage,
                  child: SvgPicture.asset(AppIcons.sendIcons),
                ),
              ),
            ),

          // ✅ Page 2 Send icon
          if (_currentPageIndex == 1)
            Positioned(
              bottom: 24.h,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _goToNextPage,
                  child: SvgPicture.asset(AppIcons.withsendicon),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
