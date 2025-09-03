import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_card.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class UpgradingWidget extends StatelessWidget {
  const UpgradingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTitle(),
          UIHelper.verticalSpace(18.h),
          _buildOptionList(),
          UIHelper.verticalSpace(18.h),
          ElevatedButton(
            onPressed: () {
              NavigationService.navigateTo(Routes.subcriptionAfterFreeScreen);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.cFFFFFF,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.r),
                side: BorderSide(color: AppColors.orangeColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Unlock full access",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c111111,
                  ),
                ),
                UIHelper.horizontalSpace(10.w),
                CustomImageView(
                  imagePath: AppIcons.buttonicon,
                  color: AppColors.orangeColor,
                  height: 18.h,
                  width: 18.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        CustomImageView(imagePath: AppIcons.bookIcon),
        UIHelper.horizontalSpace(8.w),
        Text(
          "Upgrade to PRO",
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            color: AppColors.c111111,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionList() {
    return Column(
      children: [
        _buildOption("Journey Jotter assistant"),
        _buildOption("Unlimited photo storage"),
        _buildOption("Data backup & sync"),
      ],
    );
  }

  Widget _buildOption(String text) {
    return Row(
      children: [
        CustomImageView(imagePath: AppIcons.checkMarkIcon),
        UIHelper.horizontalSpace(8),
        Text(
          text,
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            color: AppColors.c111111,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
