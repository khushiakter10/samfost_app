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




class IntroProfileSetupScreen extends StatefulWidget {
  const IntroProfileSetupScreen({super.key});

  @override
  State<IntroProfileSetupScreen> createState() => _IntroProfileSetupScreenState();
}

class _IntroProfileSetupScreenState extends State<IntroProfileSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Column(
            children: [
              CustomArroBackbutton(
                onTap: (){NavigationService.goBack;},
                  title: ''),
              UIHelper.verticalSpace(15.h),
              Image.asset(AppImages.journyimage),
              Text(
                "Sam, let's get to know you",
              textAlign: TextAlign.center,
                style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                  fontSize: 24.sp
                )
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                ' Let’s personalize your experience so your journal matches your vibe, goals,\nand travel style.',
                textAlign: TextAlign.center,
                style:   TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                  fontWeight: FontWeight.w400
                )
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: ' Let’s go!', onPressed: () {
            NavigationService.navigateTo(Routes.onboardingQustionOneScreen);
        },

        ),
      ),
    );
  }
}
