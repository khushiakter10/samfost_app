import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/subjects.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/features/home_flow/home/presentation/home_screen.dart';
import 'package:samfost_app/features/home_flow/journals/presentation/journals_screen.dart';
import '../../assets_helper/app_fonts.dart';
import '../profile_settings/profile/presentation/profile_screen.dart';
import 'badeges/presentation/badges_screen.dart';

import 'journaling/presentation/journaling_screen.dart';


class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  final _pageController = PageController(initialPage: 0);
  final _selectedIndexSubject = BehaviorSubject<int>();

  late List<NavigationItem> navigations = [];

  int getCurrentPageIndex() {
    return _pageController.hasClients ? _pageController.page?.round() ?? 0 : 0;
  }

  @override
  void initState() {
    super.initState();
    _selectedIndexSubject.stream.listen((value) {
      _pageController.jumpToPage(value);
    });

    navigations = [
      NavigationItem(
        screen: HomeScreen(onHomeNav: (int index) {
          _selectedIndexSubject.add(index);
        }),
        icon: AppIcons.homeIcon,
        title: "Home",
      ),
      NavigationItem(
        screen: JournalsScreen(),
        icon: AppIcons.journalsIcon,
        title: "Journals",
      ),
      NavigationItem(
        screen: JournalingScreen(),
        icon: AppIcons.createStoryIcon,
        title: "Story",
      ),
      NavigationItem(
        screen: BadgesScreen(onNav: (int index) {
          _selectedIndexSubject.add(index);
        }),
        icon: AppIcons.badgesIcon,
        title: "Badges",
      ),
      NavigationItem(
        screen: ProfileScreen(),
        icon: AppIcons.profileIcon,
        title: "Profile",
      ),
    ];
  }

  @override
  void dispose() {
    _selectedIndexSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFBF9,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: navigations.map((e) => e.screen).toList(),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 85.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.orangeColor.withValues(alpha: 0.2),
                offset: const Offset(0, -4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.r,
              right: 20.r,
              bottom: 10.r,
              top: 16.r,
            ),
            child: StreamBuilder(
              stream: _selectedIndexSubject,
              builder: (context, asyncSnapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(navigations.length, (index) {
                    return _buildNavItem(index);
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = getCurrentPageIndex() == index;
    return GestureDetector(
      onTap: () {
        _selectedIndexSubject.add(index);
      },
      child: Container(
        // duration: const Duration(milliseconds: 150),
        // curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.orangeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(24.r),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: navigations[index].icon,
              width: 22.0.w,
              height: 22.0.h,
              color: isSelected ? AppColors.orangeColor : AppColors.cA3A3A3,
            ),
            if (isSelected) ...[
              SizedBox(width: 4.w),
              Text(
                navigations[index].title,
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NavigationItem {
  final Widget screen;
  final String icon;
  final String title;

  NavigationItem({
    required this.screen,
    required this.icon,
    required this.title,
  });
}
