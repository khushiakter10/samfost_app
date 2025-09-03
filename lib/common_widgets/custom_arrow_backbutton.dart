import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class CustomArroBackbutton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String? text;
  final VoidCallback? onTextTap;


  const CustomArroBackbutton({
    super.key,
    required this.title,
    this.onTap,
    this.text, this.onTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 42,
            height: 42,
            padding: EdgeInsets.all(9.sp),
            decoration: ShapeDecoration(
              color: Color(0x33425466),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.r),
              ),
            ),
            child: SvgPicture.asset(AppIcons.arrwoicon, height: 24.h),
          ),
        ),

        UIHelper.horizontalSpace(58.w),


        Text(
          textAlign: TextAlign.center,
          title,
          style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        GestureDetector(
        onTap: onTextTap,
          child: Text(
           text??'',
            style:  TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
              color:  Color(0xFFFF6F3C),
              fontSize: 18.sp,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              height: 1.50,
            ),
          ),
        )
      ],
    );
  }
}
