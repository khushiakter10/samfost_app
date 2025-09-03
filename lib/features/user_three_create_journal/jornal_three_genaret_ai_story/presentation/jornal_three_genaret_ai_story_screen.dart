
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/features/journaling/ai_generated_journal_story/widget/custom_arrow_button.dart';
import 'package:samfost_app/features/journaling/ai_generated_journal_story/widget/custom_exploring.dart';
import 'package:samfost_app/features/journaling/ai_generated_journal_story/widget/custom_photo.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class JornalThreeGenaretAiStoryScreen extends StatefulWidget {
  const JornalThreeGenaretAiStoryScreen({super.key,});

  @override
  State<JornalThreeGenaretAiStoryScreen> createState() =>
      _JornalThreeGenaretAiStoryScreenState();
}

class _JornalThreeGenaretAiStoryScreenState
    extends State<JornalThreeGenaretAiStoryScreen> {
  ///===================== dotted=========================//
  final int dotCount = 5;
  List<bool> selectedDots = [];

  @override
  void initState() {
    super.initState();
    selectedDots = List<bool>.filled(dotCount, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.aigenaretbacroundimages),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomArrowButton(
                  voidCallback: (){NavigationService.navigateTo(Routes.homeScreen);},
                ),
                UIHelper.verticalSpace(12.h),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.plenicon),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              'Summer in Japan 2025',
                              style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                                  .copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(8.h),

                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.summercalander),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              'August 2-10,2025',
                              style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                                  .copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            UIHelper.horizontalSpace(8.w),
                            Container(color: Colors.black, height: 25.h, width: 2),
                            UIHelper.horizontalSpace(8.w),

                            Text(
                              'Tokyo, Japan',
                              style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                                  .copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(12.h),
                        Divider(color: AppColors.orangeColor, height: 1.h),
                        UIHelper.verticalSpace(18.h),

                        Container(
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                              image: AssetImage(AppImages.villageimage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        UIHelper.verticalSpace(12.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(dotCount, (index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDots[index] =
                                      !selectedDots[index]; // toggle
                                    });
                                  },
                                  child: Container(
                                    width: 7.w,
                                    height: 7.w,
                                    decoration: BoxDecoration(
                                      color: selectedDots[index]
                                          ? AppColors.orangeColor
                                          : AppColors.cFFFFFF,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                if (index != dotCount - 1) SizedBox(width: 8.w),
                              ],
                            );
                          }),
                        ),
                        UIHelper.verticalSpace(16.h),

                        Text(
                          'My Journey',
                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                              .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        UIHelper.verticalSpace(12.h),

                        CustomExploring(),
                        UIHelper.verticalSpace(16.h),
                        CustomPhoto(),
                        UIHelper.verticalSpace(16.h),

                        Container(
                          width: double.infinity,
                          padding:  EdgeInsets.all(12.sp),
                          decoration: ShapeDecoration(
                            color: AppColors.cFFFFFF,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1E000000),
                                blurRadius: 16,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Achievements',
                                style:  TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                    fontSize: 18.sp,fontWeight: FontWeight.w600
                                )
                            ),
                            UIHelper.verticalSpace(8.h),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.unlockedicon),
                                UIHelper.horizontalSpace(8.w),
                                Text(
                                    '5-Day Photo Streak Unlocked 🔥',
                                    style:  TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 16.sp,fontWeight: FontWeight.w400
                                    )
                                )
                              ],
                            )

                          ],
                        ),
                        )

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


