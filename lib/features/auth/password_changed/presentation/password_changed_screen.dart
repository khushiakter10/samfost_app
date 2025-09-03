import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.memorysavedbacroundimage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.greensignetureimage,
                  height: 220.h,
                ),
              UIHelper.verticalSpace(60.h),
                Text(
                  'Password changed',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(fontSize: 24.sp)
                ),
               UIHelper.verticalSpace(8.h),
                Text(
                  'Nice, your password has been\nchanged.',
                  textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle14w400c757575PlusJakartaSans
                ),


                UIHelper.verticalSpace(24.h),

                CustomElevatedButton(
                  icon: SvgPicture.asset(AppIcons.buttonicon),
                  text: 'Let me login',
                  onPressed: () {
                    NavigationService.navigateTo(Routes.loginScreen);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
