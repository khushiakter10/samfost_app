import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../assets_helper/app_colors.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: AppImages.error404Img,
              fit: BoxFit.fitWidth,
            ),
            UIHelper.verticalSpace(24.h),
            Text(
              "Oops! Something went wrong.",
              textAlign: TextAlign.center,
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                color: AppColors.c0A2540,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            Text(
              "Oops! Something went wrong.",
              textAlign: TextAlign.center,
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                color: AppColors.c000000,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
