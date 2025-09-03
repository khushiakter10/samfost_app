import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/features/user_flow/subscription_pop_up/widget/custom_prompts.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_subcription_pop_up/widget/journal_weekly.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class SubscriptionPopUpScreen extends StatefulWidget {
  const SubscriptionPopUpScreen({super.key});

  @override
  State<SubscriptionPopUpScreen> createState() =>
      _SubscriptionPopUpScreenState();
}

class _SubscriptionPopUpScreenState extends State<SubscriptionPopUpScreen> {

  bool isSelected = false;
  bool isSelectedTwo = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFF5F2,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unlock effortless\njournaling with JJ+',
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  color: const Color(0xFF111111) /* Font */,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.30,
                ),
              ),
              UIHelper.verticalSpace(18.h),

              Column(
                children: [
                  CustomPrompts(
                    icon: SvgPicture.asset(AppIcons.checkbox, height: 24.h),
                    title:
                        '✈️ Prompts that fit your trip (from\nbeach days to volcano hikes)',
                  ),
                  UIHelper.verticalSpace(16.h),
                  CustomPrompts(
                    icon: SvgPicture.asset(AppIcons.checkbox, height: 24.h),
                    title:
                    '📝 Stories written in your voice —\nfunny, chill, or chaotic',
                  ),
                  UIHelper.verticalSpace(16.h),
                  CustomPrompts(
                    icon: SvgPicture.asset(AppIcons.checkbox, height: 24.h),
                    title:
                    '⏱ Just 5 minutes a day, no blank\npages ever',
                  ),
                ],
              ),
              UIHelper.verticalSpace(18.h),

              Center(
                child: Container(
                  decoration: ShapeDecoration(
                    color:  Color(0x33FF6F3C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Text(
                      'Free trial included',
                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ) ,
                ),
              ),
              UIHelper.verticalSpace(18.h),

          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            child: JournalWeekly(isSelected: selectedIndex == 0, title: 'Weekly', subtitle: '£4.49/week',),
          ),
          UIHelper.verticalSpace(24.h),

          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 1; // select second
              });
            },
            child: JournalWeekly(isSelected: selectedIndex == 1, title: 'Monthly', subtitle: '£9.99/month',),
          ),

              UIHelper.verticalSpace(24.h),

              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2; // select second
                  });
                },
                child: JournalWeekly(
                  traliding: 'Save-25%',
                  color: AppColors.cFFD4C5,
                  isSelected: selectedIndex == 2, title: 'Yearly', subtitle: '£89.99/year'),
              ),
              UIHelper.verticalSpace(12.h),

              Center(
                child: Text(
                  'No commitment. Cancel anytime.',
                  style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                    color:  Color(0xFF2F2F2F),
                    fontSize: 14.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),
              CustomElevatedButton(
                icon: SvgPicture.asset(AppIcons.buttonicon),
                text: 'Try JJ+ free today', onPressed: () {
                  NavigationService.navigateTo(Routes.createJournalScreen);
              }),
              UIHelper.verticalSpace(16.h),

              GestureDetector(
                onTap: (){NavigationService.navigateTo(Routes.manualCreateJournalScreen);},
                child: Center(
                  child: Text(
                    'I want to journal manually',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                      color:  Color(0xFF111111),
                      fontSize: 14.sp,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                    ),
                  ),
                ),
              )

          ],
          ),
        ),
      ),
    );
  }
}


