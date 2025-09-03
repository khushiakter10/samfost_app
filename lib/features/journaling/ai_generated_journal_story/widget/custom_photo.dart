import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class CustomPhoto extends StatelessWidget {
  const CustomPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 18.h,
      ),
      decoration: ShapeDecoration(
        color:  Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19FF6F3C),
            blurRadius: 16,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Photos gallery',
                style: TextFontStyle
                    .textStyle16w500c000000PlusJakartaSans
                    .copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See all photos (12)',
                style: TextFontStyle
                    .textStyle14w500c5E5E5EPlusJakartaSans
                    .copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(16.h),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 96.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(AppImages.photooneimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 96.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(AppImages.phototwoimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 96.h,
                  margin: EdgeInsets.only(left: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(AppImages.photoimagethree),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}