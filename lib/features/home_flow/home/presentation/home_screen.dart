import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/features/home_flow/home/presentation/widgets/header_widget.dart';
import 'package:samfost_app/features/home_flow/home/presentation/widgets/journeys_widget.dart';
import 'package:samfost_app/features/home_flow/home/presentation/widgets/start_journey_widget.dart';
import 'package:samfost_app/features/home_flow/home/presentation/widgets/upgrading_widget.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

import '../../../../assets_helper/app_colors.dart';
import 'widgets/achievements_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onHomeNav});

  final Function(int index) onHomeNav;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(10.h),
              HeaderWidget(onTap: () {
                onHomeNav(4);
              },),
              UIHelper.verticalSpace(18.h),
              JourneysWidget(),
              UIHelper.verticalSpace(18.h),
              StartJourneyWidget(onTap: () {
                onHomeNav(2);
              },),
              UIHelper.verticalSpace(18.h),
              AchievementsWidget(onTap: () {
                onHomeNav(3);
              },),
              UIHelper.verticalSpace(18.h),
              UpgradingWidget(),
              UIHelper.verticalSpace(18.h),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NavigationService.navigateTo(Routes.tripJournalScreen);
          },
          backgroundColor: AppColors.orangeColor,
          shape: const CircleBorder(),
          child: Icon(Icons.add, color: AppColors.cFFFFFF),
        ),
      ),
    );
  }
}
