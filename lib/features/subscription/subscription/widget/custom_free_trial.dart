import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class CustomFreeTrial extends StatelessWidget {
  const CustomFreeTrial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0x19FF6F3C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Free trial',
                style: TextFontStyle
                    .textStyle24w600cFF6F3CPlusJakartaSans,
              ),

              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  '3 day free trial',
                  style: TextFontStyle
                      .textStyle16w500c000000PlusJakartaSans
                      .copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(18.h),

          Center(
            child: Text(
              'Your travel story starts here. Try Journey Jotter free for 3 days',
              style: TextFontStyle
                  .textStyle16w500c000000PlusJakartaSans
                  .copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Text(
            'Every plan starts with a 3-day free trial\n— try JJ, fall in love, cancel anytime.',
            style: TextFontStyle
                .textStyle16w500c000000PlusJakartaSans
                .copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Text(
              'Don’t worry, we’ll remind you 2 days before it ends',
              style:TextFontStyle.textStyle14w500c5E5E5EPlusJakartaSans.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400)
          )
        ],
      ),
    );
  }
}
