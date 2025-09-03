
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class CustomWeekly extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
 final EdgeInsetsGeometry? padding;
 final String? traliding;

  const CustomWeekly({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subtitle, this.color, this.borderRadius, this.padding, this.traliding,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: isSelected ? AppColors.cFFFFFF: AppColors.cFFFFFF,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: isSelected ? 2 : 1,
            color: isSelected ? AppColors.orangeColor : AppColors.cE8E8E8
          ),

          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 21.w,
            height: 21.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48.r),
              border: isSelected
                  ? null
                  : Border.all(
                      color: AppColors.orangeColor,
                      width: 2,
                    ),

            ),
            child: isSelected
                ? SvgPicture.asset(
                    AppIcons.checkbox,
                    height: 24.h,
                  )
                : null,
          ),
          UIHelper.horizontalSpace(8.h),
          Text(title , style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
            fontSize: 18.sp
          ),
          ),
          UIHelper.horizontalSpace(7.w),

          Container(
            decoration: BoxDecoration(
              color:color,
              borderRadius:borderRadius?? BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: padding?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child:Text(
                  traliding??'',
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(fontSize: 12.sp)
              )
            ),
          ),

          const Spacer(),
          Text(
            subtitle,
            style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                fontSize: 16.sp)
          ),
        ],
      ),
    );
  }
}
