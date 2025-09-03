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


class RightPlaceScreen extends StatelessWidget {
  const RightPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            children: [
               CustomArroBackbutton(
                onTap: (){NavigationService.goBack;},
                  title: ''),
              Image.asset(AppImages.rightpluchimage, height: 327.h),
              UIHelper.verticalSpace(24.h),
              Text(
                'You’re in the right place.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                    .copyWith(fontSize: 24.sp),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Journey Jotter helps you remember the tiny details, reflect on the big moments, and turn every story into something worth keeping.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'No effort, no blank pages. Just your memories, captured your way.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 55),

        child:  CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: "Let's keep going", onPressed: () {
            NavigationService.navigateTo(Routes.onboardingQustionTwoScreen);
        },),
      ),
    );
  }
}
