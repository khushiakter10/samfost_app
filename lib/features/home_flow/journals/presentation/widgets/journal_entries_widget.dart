import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/common_widgets/custom_card.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../../common_widgets/custom_card_title.dart';
import 'journal_entries_item.dart';

class JournalEntriesWidget extends StatelessWidget {
  const JournalEntriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardTitle(title: "Journal Entries"),
          UIHelper.verticalSpace(16.h),
          Column(
            children: [
              JournalEntriesItem(
                image: "assets/images/journeys_bg_img.png",
                title: "Exploring Asakusa temple",
                content: "The ancient temple was breathtaking with its massive",
                date: "July 19, 2025",
              ),

              JournalEntriesItem(
                image: "assets/images/journeys_bg_img.png",
                title: "Exploring Asakusa temple",
                content: "The ancient temple was breathtaking with its massive",
                date: "July 19, 2025",
              ),

              JournalEntriesItem(
                image: "assets/images/journeys_bg_img.png",
                title: "Exploring Asakusa temple",
                content: "The ancient temple was breathtaking with its massive",
                date: "July 19, 2025",
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Center(
            child: GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "View all entries",
                      style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                        color: AppColors.orangeColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.r,
                      color: AppColors.orangeColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
