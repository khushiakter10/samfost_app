
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';


class TryingLocalFood extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const TryingLocalFood({
    super.key,
    required this.title,
    required this.isSelected, this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: ShapeDecoration(
          color: AppColors.cF3F3F3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              color: isSelected ? AppColors.orangeColor : Colors.transparent,
              width: 2.w,
            ),
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: TextFontStyle.textStyle14w500c5E5E5EPlusJakartaSans.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}