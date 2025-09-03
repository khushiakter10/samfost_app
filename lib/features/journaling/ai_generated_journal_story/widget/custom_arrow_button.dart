import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';


class CustomArrowButton extends StatelessWidget {
  final VoidCallback? voidCallback;
  final VoidCallback? voidCallbackCopy;
  const CustomArrowButton({
    super.key,
    this.voidCallback,
    this.voidCallbackCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: voidCallback,
          child: Container(
            width: 42.w,
            height: 42.h,
            padding: EdgeInsets.all(9),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.r),
              ),
            ),
            child: SvgPicture.asset(AppIcons.arrwleftorangeicon, height: 24.h),
          ),
        ),
        GestureDetector(
          onTap: voidCallbackCopy,
          child: Container(
            width: 42.w,
            height: 42.h,
            padding: EdgeInsets.all(9),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.r),
              ),
            ),
            child: SvgPicture.asset(AppIcons.copyicon, height: 24.h),
          ),
        ),
      ],
    );
  }
}
