
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class OnboardingPageTwoContent extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onJumpToLast;

  const OnboardingPageTwoContent({
    super.key,
    required this.onBack,
    required this.onNext,
    required this.onJumpToLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onbordaingtwo),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Text(
                'Not your average \njournal.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                  color: Colors.black,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,

                ),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'JJ remembers the little things and the big moments, so you get more than just\n‘Nice sunset today.’ From your volcano\nhike last week to the tuk-tuk driver\nblasting Beyoncé today, it captures your\ntrip in your style — whether you’re chill\ncheeky, or full-on chaotic.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c454545PlusJakartaSans,
              ),
              UIHelper.verticalSpace(12.h),

              /// --- Dot indicator (only dots, no button) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onBack,
                    child: _dot(false),
                  ),
                  SizedBox(width: 4.w),
                  _dot(true), // active
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: onNext,
                    child: _dot(false),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(bool isActive) {
    return Container(
      width: 6.w,
      height: 6.h,
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFFFF6F3C) :AppColors.cD9D9D9,
        shape: const OvalBorder(),
      ),
    );
  }
}
