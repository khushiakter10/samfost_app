
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/features/subscription/subscription/widget/custom_free_trial.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedPlanIndex = -1;

  void selectPlan(int index) {
    setState(() {
      selectedPlanIndex = selectedPlanIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              CustomArroBackbutton(
                onTap: () {
                  NavigationService.goBack;
                },
                title: 'Choose your plan',
              ),
              UIHelper.verticalSpace(18.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      CustomFreeTrial(),
                      UIHelper.verticalSpace(24.h),

                      // Weekly Plan
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: selectedPlanIndex == 0
                              ? AppColors.cFFF1EB
                              :Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weekly Plan',
                              style: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans,
                            ),
                            UIHelper.verticalSpace(12.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '£4.49/',
                                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(4.w),
                                    Text(
                                      "week",
                                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpace(16.h),
                                Text(
                                  'Perfect for short-term travelers looking to document quick trips.',
                                  style: TextFontStyle.textStyle14w500c5E5E5EPlusJakartaSans.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                UIHelper.verticalSpace(24.h),
                                ...[
                                  "Your own travel sidekick (AI\nthat journals for you)",
                                  'Unlimited photo memories',
                                  ' Safe & sound backups',
                                ].map(
                                      (feature) => Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.checkbox,
                                          height: 24.h,
                                        ),
                                        UIHelper.horizontalSpace(6.w),
                                        Text(
                                          feature,
                                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                CustomElevatedButton(
                                  icon: SvgPicture.asset(
                                    AppIcons.buttonicon,
                                    color: selectedPlanIndex == 0 ? AppColors.cFFFFFF : AppColors.orangeColor,
                                  ),
                                  onPressed: () => selectPlan(0),
                                  borderSide: BorderSide(color: AppColors.orangeColor),
                                  backgroundColor: selectedPlanIndex == 0
                                      ? AppColors.orangeColor
                                      : AppColors.cFFFFFF,
                                  text: 'Start free trial',
                                  textStyle: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans.copyWith(
                                    color: selectedPlanIndex == 0 ? Colors.white : AppColors.orangeColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),

                      // Monthly Plan
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: selectedPlanIndex == 1
                              ? AppColors.cFFF1EB
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Monthly Plan',
                                  style: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: ShapeDecoration(
                                    color: AppColors.cFFFFFF,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Text(
                                    '🔥 Most Popular',
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(12.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '£9.99/',
                                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(4.w),
                                    Text(
                                      "month",
                                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpace(16.h),
                                Text(
                                  'Perfect for backpackers and digital nomads.',
                                  style: TextFontStyle.textStyle14w500c5E5E5EPlusJakartaSans.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                UIHelper.verticalSpace(24.h),
                                ...[
                                  "Your own travel sidekick (AI\nthat journals for you)",
                                  'Unlimited photo memories',
                                  ' Safe & sound backups',
                                ].map(
                                      (feature) => Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.checkbox,
                                          height: 24.h,
                                        ),
                                        UIHelper.horizontalSpace(6.w),
                                        Text(
                                          feature,
                                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                CustomElevatedButton(
                                  icon: SvgPicture.asset(
                                    AppIcons.buttonicon,
                                    color: selectedPlanIndex == 1 ? AppColors.cFFFFFF : AppColors.orangeColor,
                                  ),
                                  onPressed: () => selectPlan(1),
                                  borderSide: BorderSide(color: AppColors.orangeColor),
                                  backgroundColor: selectedPlanIndex == 1
                                      ? AppColors.orangeColor
                                      : AppColors.cFFFFFF,
                                  text: 'Start free trial',
                                  textStyle: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans.copyWith(
                                    color: selectedPlanIndex == 1 ? Colors.white : AppColors.orangeColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),

                      // Best Value Plan
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: selectedPlanIndex == 2
                              ? AppColors.cFFF1EB
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Yearly Plan',
                                  style: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF1EB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Best Value',
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(12.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' £89.99/',
                                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(4.w),
                                    Text(
                                      " year",
                                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpace(12.h),
                                Text(
                                  'Just £7.49/month.',
                                  style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                Text(
                                  'Ideal for frequent travelers who want to keep a journal of all their adventures throughout the year.',
                                  style: TextFontStyle.textStyle14w500c5E5E5EPlusJakartaSans.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                UIHelper.verticalSpace(24.h),
                                ...[
                                  "Your own travel sidekick (AI\nthat journals for you)",
                                  'Unlimited photo memories',
                                  ' Safe & sound backups',
                                ].map(
                                      (feature) => Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.checkbox,
                                          height: 24.h,
                                        ),
                                        UIHelper.horizontalSpace(6.w),
                                        Text(
                                          feature,
                                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                CustomElevatedButton(
                                  icon: SvgPicture.asset(
                                    AppIcons.buttonicon,
                                    color: selectedPlanIndex == 2 ? AppColors.cFFFFFF : AppColors.orangeColor,
                                  ),
                                  onPressed: () => selectPlan(2),
                                  borderSide: BorderSide(color: AppColors.orangeColor),
                                  backgroundColor: selectedPlanIndex == 2
                                      ? AppColors.orangeColor
                                      : AppColors.cFFFFFF,
                                  text: 'Start free trial',
                                  textStyle: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans.copyWith(
                                    color: selectedPlanIndex == 2 ? Colors.white : AppColors.orangeColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(24.h),

                      Text(
                          'Your next adventure is about to start — let’s make sure you remember it all.',
                          textAlign: TextAlign.center,
                          style:TextFontStyle.textStyle14w500c5E5E5EPlusJakartaSans.copyWith(
                              fontSize: 16.sp,fontWeight: FontWeight.w400
                          )
                      ),
                      UIHelper.verticalSpace(12.h),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.checkbox,height: 16.h,color: AppColors.c757575,),
                          UIHelper.horizontalSpace(8.w),
                          Text(
                              'Cancel anytime — but we bet you’ll stay',
                              style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                                  fontSize: 16.sp,fontWeight: FontWeight.w400
                              )
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
