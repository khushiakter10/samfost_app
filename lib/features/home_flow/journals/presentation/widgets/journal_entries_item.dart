import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class JournalEntriesItem extends StatelessWidget {
  const JournalEntriesItem({
    super.key,
    required this.image,
    required this.date,
    required this.title,
    required this.content,
  });

  final String image;
  final String date;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12.h, top: 12.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cF3F3F3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: image,
            height: 90.h,
            width: 90.w,
            radius: BorderRadius.circular(12.r),
          ),
          UIHelper.horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c757575,
                    fontSize: 12.sp,
                  ),
                ),
                UIHelper.verticalSpace(4.h),

                Text(
                  title,
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c111111,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                UIHelper.verticalSpace(4.h),

                Text(
                  content,
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c5E5E5E,
                    fontSize: 14.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
