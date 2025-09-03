import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/features/home_flow/common/widgets/journal_item_widget.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class JournalsScreen extends StatelessWidget {
  const JournalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Journals",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.c111111,
                  ),
                ),
                UIHelper.verticalSpace(18.h),
                Column(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.journalDetailsScreen);
                      },
                      child: Column(
                        children: [
                          JournalItemWidget(),
                          UIHelper.verticalSpace(16.h),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
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
