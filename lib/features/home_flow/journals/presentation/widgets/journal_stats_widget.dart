import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_card.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import '../../../../../assets_helper/app_colors.dart';
import '../../../../../assets_helper/app_fonts.dart';
import '../../../../../common_widgets/custom_card_title.dart';

class JournalStatsWidget extends StatelessWidget {
  const JournalStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(child: Column(children: [_buildHeader(), _buildStats()]));
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCardTitle(title: "Milestones & stats"),

        Text(
          "24 photos",
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            fontSize: 14.sp,
            color: AppColors.c5E5E5E,
          ),
        ),
      ],
    );
  }

  _buildStats() {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1,
      ),
      children: [
        _buildStatItem(
          color: AppColors.cFFF7ED,
          icon: AppIcons.fireIcon,
          title: "Streak",
          count: "5",
          label: "days",
        ),

        _buildStatItem(
          color: AppColors.cEFF6FF,
          icon: AppIcons.wordIcon,
          title: "Words",
          count: "4329",
          label: "written",
        ),

        _buildStatItem(
          color: AppColors.cF0FDF4,
          icon: AppIcons.photoIcon,
          title: "Photos",
          count: "24",
          label: "added",
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required Color color,
    required String icon,
    required String title,
    required String count,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(imagePath: icon),
              // UIHelper.horizontalSpace(2.w),
              Text(
                title,
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.c5E5E5E,
                ),
              ),
            ],
          ),
          Text(
            count,
            style: TextFontStyle.textStylePlusJakartaSans.copyWith(
              fontSize: 16.sp,
              color: AppColors.c111111,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: TextFontStyle.textStylePlusJakartaSans.copyWith(
              fontSize: 12.sp,
              color: AppColors.c5E5E5E,
            ),
          ),
        ],
      ),
    );
  }
}
