
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class OnboardingOneScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onJumpToLast;

  const OnboardingOneScreen({
    super.key,
    required this.onNext,
    required this.onJumpToLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onbordaingbacroundimage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(520.h),
            Text(
              'Journey Jotter makes sure you never\nforget the little things, capturing your day\nin just 5 minutes. Type or voicenote, and\nyou’re done.',
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
           UIHelper.verticalSpace(18.h),

            /// --- Dot indicator (only dots, no button) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _dot(true), // active
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: onNext,
                  child: _dot(false),
                ),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: onJumpToLast,
                  child: _dot(false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }





  Widget _dot(bool isActive) {
    return Container(
      width: 6.w,
      height: 6.h,
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFFFF6F3C) : AppColors.cD9D9D9,
        shape: const OvalBorder(),
      ),
    );
  }
}
