
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class DesignedForPaceScreen extends StatelessWidget {
  const DesignedForPaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          child: Column(
            children: [

              CustomArroBackbutton(
                onTap: (){NavigationService.goBack;},
                  title: ''),

              Image.asset(AppImages.designimage, height: 327.h),
              Text(
                'Designed for your pace.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                    .copyWith(fontSize: 24.sp),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Whether you journal daily or just try your best, JJ helps you stay consistent.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Our prompts make it effortless, and your memories stay fresh, even when the days\n(or hangovers) blur together',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'P.S. The more often you journal, the more you’ll remember.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Almost there',
          onPressed: () {
           NavigationService.navigateTo(Routes.onboardingQustionThreeScreen);
          },
        ),
      ),
    );
  }
}
