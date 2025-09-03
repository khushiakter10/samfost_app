import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../../common_widgets/custom_card.dart';

class StartJourneyWidget extends StatelessWidget {
  const StartJourneyWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let’s lock in today’s memories 🎒",
            style: TextFontStyle.textStylePlusJakartaSans.copyWith(
              fontSize: 24.sp,
              color: AppColors.c000000,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          UIHelper.verticalSpace(12.h),
          CustomElevatedButton(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            iconPlus: Icon(Icons.add, color: AppColors.cFFFFFF, size: 24.r),
            text: "Start today's journal",
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
