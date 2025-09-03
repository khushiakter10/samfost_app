import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

import '../../../networks/internet_checker/internet_checker_controller.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({super.key});

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  final controller = Get.find<InternetController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: AppImages.offlineForestImg,
              fit: BoxFit.fitWidth,
            ),
            Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "You’re offline",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c0A2540,
                  ),
                ),
                Text(
                  "Looks like you’re off the grid. JJ+ needs WiFi to work. Don’t worry — your adventure isn’t lost! Try manual journaling now, and we’ll catch you back online later.",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c2F2F2F,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: "Manual Journal",
                  icon: CustomImageView(
                    imagePath: AppIcons.buttonicon,
                  ),
                  onPressed: () {},
                ),
                UIHelper.verticalSpace(18.h),
                GestureDetector(
                  onTap: () {
                    Get.snackbar("Internet Connection", "Trying connecting....", backgroundColor: AppColors.cFFFFFF, colorText: AppColors.c111111);
                    controller.retryConnection();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text("Try again", style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c111111,
                    ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
