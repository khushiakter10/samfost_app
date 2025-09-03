import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/features/home_flow/badeges/widget/progress_bar.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class NextWinsItem extends StatelessWidget {

  final dynamic icon;
  final dynamic title;
  final dynamic subTitle;
  final dynamic completeValue;
  final dynamic mainValue;
  final dynamic xpPlus;

  const NextWinsItem({
    super.key,

    required this.icon,
    required this.title,
    required this.subTitle,
    required this.completeValue,
    required this.mainValue,
    required this.xpPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(width: 1, color: Color(0xfff3f3f3))
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 11, vertical: 15), child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, height: 48.h, width: 48.w,)
            ],
          ),
          UIHelper.horizontalSpace(12.w),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans,
              ),
              Text(
                subTitle,
                style:
                TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                    fontSize: 14.sp, fontWeight: FontWeight.w400
                ),
              ),
              UIHelper.verticalSpace(12.h),
              HomeProgressBar(completeValue: completeValue, mainValue: mainValue, backgroundColor: Color(0xffd1d1d1),),
              UIHelper.verticalSpace(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$completeValue/$mainValue completed",
                    style:
                    TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                        fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xff2F2F2F)
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        xpPlus,
                        style:
                        TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.w600, color: Color(0xffFF6F3C)
                        ),
                      ),
                      UIHelper.horizontalSpace(4.h),
                      SvgPicture.asset(AppIcons.xpIcon, height: 16.h, width: 16.w,)
                    ],
                  )
                ],
              )
            ],
          ))
        ],
      ),),
    );
  }
}
