import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../assets_helper/app_colors.dart';
import '../../../../../assets_helper/app_fonts.dart';
import '../../../../../assets_helper/app_image.dart';
import '../../../../../common_widgets/custom_image_view.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Alex👋",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.c111111,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Free",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  color: AppColors.orangeColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
          CustomImageView(
            imagePath: AppImages.demoUserPic,
            height: 50.h,
            width: 50.w,
            radius: BorderRadius.circular(50.r),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
