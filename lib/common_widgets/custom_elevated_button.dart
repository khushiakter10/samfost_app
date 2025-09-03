import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final Widget? iconPlus;
  final EdgeInsets? padding;
  final BorderSide? borderSide;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,

    this.icon,
    this.iconPlus, this.borderSide, this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side:borderSide?? BorderSide(color: Colors.transparent),
        elevation: 0,
        backgroundColor:backgroundColor?? AppColors.orangeColor,
        padding: padding ?? EdgeInsets.symmetric(vertical: 13.h, horizontal: 55.w),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ?iconPlus,
        Flexible(
          child: Text(
            text,
           maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle??TextFontStyle.textStyle14w500cFFFFFF.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        UIHelper.horizontalSpace(10.w),

          ?icon,
        ],
      ),
    );
  }
}





