
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class OnboardingPageThreeContent extends StatelessWidget {
  final VoidCallback onStart;

  const OnboardingPageThreeContent({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFBFFFC,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Image.asset(AppImages.onbordingimage, height: 459.h),
                UIHelper.verticalSpace(18.h),
                Text(
                  'A journal that\nsounds just like you.',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  'In just minutes, JJ turns your trip into a story worth telling — complete with your photos, your voice, and all those little moments only you could capture.',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle16w500c454545PlusJakartaSans,
                ),
                UIHelper.verticalSpace(18.h),

                // Dot indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _dot(false),
                    SizedBox(width: 4.w),
                    _dot(false),
                    SizedBox(width: 4.w),
                    _dot(true),
                  ],
                ),

                UIHelper.verticalSpace(24.h),


                CustomElevatedButton(
                  text: 'Start your story',
                  icon: SvgPicture.asset(AppIcons.buttonicon),
                  onPressed: onStart,
                ),
              ],
            ),
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
        color: isActive ? const Color(0xFFFF6F3C) : AppColors.cD9D9D9,
        shape: const OvalBorder(),
      ),
    );
  }
}

