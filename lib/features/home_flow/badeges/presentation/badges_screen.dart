import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_card.dart';
import 'package:samfost_app/features/home_flow/badeges/widget/AchievedBadge.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../widget/bag_badge.dart';
import '../widget/next_win_card.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key, required this.onNav});

  final Function(int index) onNav;

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFDF5E6,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpace(24.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.onFireBg,
                      height: 211.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 12.0,
                          percent: 0.7, 
                          center: const Text(
                            "70%",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          progressColor: Color(0xffFF6F3C),
                          backgroundColor: Colors.white,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        UIHelper.verticalSpace(6.h),
                        Text(
                          "🔥 On fire!",
                          style:
                          TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                            fontSize: 24.sp
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              UIHelper.verticalSpace(24.h),
              AchievedBadge(),
              UIHelper.verticalSpace(24.h),
              BagBadgeCard(onTap: () {
                widget.onNav(2);
              }),
              UIHelper.verticalSpace(24.h),

              CustomCard(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your next wins",
                    style:
                    TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans,
                  ),
                  UIHelper.verticalSpace(16.h),
                  NextWinsItem(
                    title: "7 days of summer stories",
                    subTitle: "Share a summer memory daily",
                    icon: AppIcons.sevenSummer,
                    completeValue: 4,
                    mainValue: 7,
                    xpPlus: "+100 XP",
                  ),
                  UIHelper.verticalSpace(16.h),
                  NextWinsItem(
                    title: "Photo master",
                    subTitle: "Upload travel photos ",
                    icon: AppIcons.photoMaster,
                    completeValue: 15,
                    mainValue: 150,
                    xpPlus: "+200 XP",
                  )
                ],
              )),

              UIHelper.verticalSpace(24.h),

            ],
          ),
        ),
      ),
    );
  }
}

