import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class CustomExploring extends StatelessWidget {
  const CustomExploring({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 18.h,
      ),
      decoration: ShapeDecoration(
        color:  Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.cD1D1D1),
          borderRadius: BorderRadius.circular(18.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exploring Asakusa temple',
            style: TextFontStyle
                .textStyle16w500c000000PlusJakartaSans
                .copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          UIHelper.verticalSpace(30.h),
          Text(
            "My first few days were spent wandering through the streets of Kyoto. The narrow alleyways of Gion, with geishas moving silently under red lanterns, felt like scenes from a dream. I woke up early one morning to hike through the Fushimi Inari shrine, passing under thousands of bright torii gates. It felt spiritual — like the mountain was guiding me toward something peaceful within.\n\nOne of the most unexpected highlights was attending a local summer matsuri (festival) in a small town near Osaka. Children ran through the streets with paper fans, fireworks painted the night sky, and I tried my first ever takoyaki. The heat was intense, but every sweaty moment was worth it.",
            style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                fontSize: 16.sp,fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}