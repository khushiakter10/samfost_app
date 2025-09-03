import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_card.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../common_widgets/custom_elevated_button.dart';

class BagBadgeCard extends StatelessWidget {
  const BagBadgeCard({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your badges",
            style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans,
          ),
          UIHelper.verticalSpace(16.h),
          Image.asset(
            AppImages.bagImage,
            height: 200.h,
            width: double.infinity,
          ),
          UIHelper.verticalSpace(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No badges yet — the adventure\nhasn’t even started",
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans,
              ),
            ],
          ),
          UIHelper.verticalSpace(16.h),
          CustomElevatedButton(
            text: "Start your first challenge",
            onPressed: onTap,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            icon: CustomImageView(
              imagePath: AppIcons.buttonicon,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
