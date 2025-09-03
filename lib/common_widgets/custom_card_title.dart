import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets_helper/app_colors.dart';
import '../assets_helper/app_fonts.dart';

class CustomCardTitle extends StatelessWidget {
  const CustomCardTitle({
    super.key,
    required this.title,
    this.fontSize,
    this.color,
  });

  final String title;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextFontStyle.textStylePlusJakartaSans.copyWith(
        color: color ?? AppColors.c111111,
        fontSize: fontSize ?? 18.sp,
      ),
    );
  }
}
