import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import '../../../../../assets_helper/app_colors.dart';
import '../../../../../assets_helper/app_fonts.dart';
import '../../../../../assets_helper/app_icons.dart';
import '../../../../../assets_helper/app_image.dart';
import '../../../../../common_widgets/custom_card.dart';
import '../../../../../common_widgets/custom_card_title.dart';
import '../../../../../common_widgets/custom_image_view.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/ui_helpers.dart';

class TripOverviewWidget extends StatelessWidget {
  const TripOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCardTitle(title: "Trip Overview"),
              GestureDetector(
                onTap: () {
                  NavigationService.navigateTo(Routes.JournalJourneyDetails);
                },
                child: Text(
                  "View all",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          _buildTripItem(AppImages.destinationImg, ["Tokyo", "kyot", "Osaka"]),
          UIHelper.verticalSpace(12.h),
          _buildItem(AppImages.calendarImg, "July 12 - 25, 2025 (14 days)"),
          UIHelper.verticalSpace(12.h),
          _buildItem(
            AppImages.flagGreenImg,
            "Experience traditional culture & modern Japan",
          ),
        ],
      ),
    );
  }

  Widget _buildTripItem(String image, List<String> texts) {
    return Row(
      children: [
        CustomImageView(imagePath: image, height: 32.h, width: 32.w),
        UIHelper.horizontalSpace(12.w),
        Wrap(
          children: List.generate(texts.length, (index) {
            return Row(
              children: [
                Text(
                  texts[index],
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.c111111,
                  ),
                ),
                if ((texts.length - 1) != index)
                  CustomImageView(imagePath: AppIcons.arrowGreenIcon),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _buildItem(String image, String text) {
    return Row(
      children: [
        CustomImageView(imagePath: image, height: 32.h, width: 32.w),
        UIHelper.horizontalSpace(12.w),
        Expanded(
          child: Text(
            text,
            style: TextFontStyle.textStylePlusJakartaSans.copyWith(
              fontSize: 16.sp,
              color: AppColors.c111111,
            ),
          ),
        ),
      ],
    );
  }
}
