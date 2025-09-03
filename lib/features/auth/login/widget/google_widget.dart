import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class GoogleWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback? onTap;

  const GoogleWidget({
    super.key, required this.icon, required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,

        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.w,
                color: AppColors.cD1D1D1
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            UIHelper.horizontalSpace(10.h),
            Text(
                text,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600
                )
            )
          ],
        ),
      ),
      ),
    );
  }
}