import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../assets_helper/app_colors.dart';
import '../../../../assets_helper/app_fonts.dart';
import '../../../../assets_helper/app_icons.dart';
import '../../../../common_widgets/custom_image_view.dart';
import '../../../../helpers/ui_helpers.dart';

class JournalItemWidgetContent extends StatelessWidget {
  const JournalItemWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summer in Japan 2025",
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            color: AppColors.cFFFFFF,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        UIHelper.verticalSpace(12.h),
        _buildTextWithIcon(icon: AppIcons.locationIcon, text: "Tokyo, Japna"),
        _buildTextWithIcon(icon: AppIcons.clockIcon, text: "14-24, 2025"),
        UIHelper.verticalSpace(12.h),
        _buildProgress(70, 5),
      ],
    );
  }

  Widget _buildTextWithIcon({required String icon, required String text}) {
    return Row(
      children: [
        CustomImageView(
          imagePath: icon,
          width: 18.w,
          height: 18.h,
          color: AppColors.cFFFFFF,
        ),
        UIHelper.horizontalSpace(6.w),
        Text(
          text,
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            color: AppColors.cFFFFFF,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProgress(int percent, int days) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$percent% Completed",
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                color: AppColors.cFFFFFF,
              ),
            ),
            UIHelper.horizontalSpace(4.w),
            Row(
              children: [
                CustomImageView(
                  imagePath: AppIcons.fireIcon,
                  height: 14.h,
                  width: 14.w,
                ),
                Text(
                  "$days days streak",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.cFFFFFF,
                  ),
                ),
              ],
            ),
          ],
        ),
        UIHelper.verticalSpace(6.h),
        LinearProgressIndicator(
          value: percent / 100,
          backgroundColor: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(8.r),
          minHeight: 10.h,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.orangeColor),
        ),
      ],
    );
  }
}
