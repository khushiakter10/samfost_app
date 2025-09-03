import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import '../../../../assets_helper/app_colors.dart';
import '../../../../assets_helper/app_fonts.dart';
import '../../../../assets_helper/app_icons.dart';
import '../../../../assets_helper/app_image.dart';
import '../../../../common_widgets/click_tooltip.dart';
import '../../../../common_widgets/custom_card.dart';
import '../../../../helpers/ui_helpers.dart';

class SeeAllBadges extends StatefulWidget {
  const SeeAllBadges({super.key});

  @override
  State<SeeAllBadges> createState() => _SeeAllBadgesState();
}

class _SeeAllBadgesState extends State<SeeAllBadges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.c425466.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              NavigationService.goBack;
            },
            icon: Icon(Icons.arrow_back, color: AppColors.c243B52),
          ),
        ),
        title: Text(
          "Look at you go 🏅",
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            fontSize: 20.sp,
            color: AppColors.c111111,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              UIHelper.verticalSpace(10.h),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      AppImages.onFireBg,
                      height: 119.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned( left: 30, top: 0,bottom: 0, child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 10.0,
                          percent: 0.7,
                          center: const Text(
                            "70%",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          progressColor: Color(0xffFF6F3C),
                          backgroundColor: Colors.white,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        UIHelper.horizontalSpace(12.h),
                        Text(
                          "🔥 On fire!",
                          style:
                          TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                              fontSize: 24.sp
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              UIHelper.verticalSpace(30.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 18.h,
                  mainAxisExtent: 103.h + 30.h,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ClickTooltip(
                    title: "Rising Star",
                    message: "Write in your journal for 7 days",
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 103.h, // fixed height for card
                          child: Container(
                            padding: EdgeInsets.all(36.r),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.c000000.withValues(alpha: 0.12),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              color: Color(0xfff9eaff),
                              borderRadius: BorderRadius.circular(18.r)
                            ),
                            child: Center(
                              child: Image.asset(AppIcons.photographerIcon, height: 40.h, width: 40.w,),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Daily streak",
                          style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
