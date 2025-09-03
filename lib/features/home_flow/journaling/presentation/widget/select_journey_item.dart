
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../assets_helper/app_colors.dart';
import '../../../../../assets_helper/app_fonts.dart';
import '../../../../../common_widgets/custom_image_view.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';

class SelectJourneyItem extends StatelessWidget {
  const SelectJourneyItem({
    super.key,
    required this.image,
    required this.date,
    required this.title,
  });

  final String image;
  final String date;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12.h, top: 12.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cF3F3F3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: image,
            height: 60.h,
            width: 60.w,
            radius: BorderRadius.circular(12.r),
          ),
          UIHelper.horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c111111,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                UIHelper.verticalSpace(4.h),
                Text(
                  date,
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c757575,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  _buildButton() {
    return ElevatedButton(
      onPressed: () {
        NavigationService.navigateTo(Routes.aiChatScreen);
      },
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.transparent),
        elevation: 0,
        backgroundColor:AppColors.orangeColor,
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.r),
        ),
      ),
      child: Text(
        "Continue Journey",
        maxLines: 2,
        style: TextFontStyle.textStyle14w500cFFFFFF.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
