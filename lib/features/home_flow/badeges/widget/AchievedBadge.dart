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


class AchievedBadge extends StatelessWidget {
  const AchievedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your badges",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.c000000,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  NavigationService.navigateTo(Routes.seeAllBadges);
                },
                child: Text(
                  "See all",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.c000000,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItems(
                false,
                AppColors.cFFD4C5,
                "5-Day Streak",
                AppIcons.strikeIcon,
              ),
              _buildItems(
                false,
                AppColors.cF9EAFF,
                "Photographer",
                AppIcons.photographerIcon,
              ),
              _buildItems(
                true,
                AppColors.cE8E8E8,
                "Explorer",
                AppIcons.exploreIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItems(bool locked, Color color, String text, String icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: CustomImageView(imagePath: icon),
            ),
            if (locked)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.c6B7280,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.lock, size: 12.r, color: AppColors.cFFFFFF),
                ),
              ),
          ],
        ),
        UIHelper.verticalSpace(6.h),
        Text(
          text,
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            color: AppColors.c111111,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
