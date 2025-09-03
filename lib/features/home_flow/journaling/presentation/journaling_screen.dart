import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/common_widgets/divider_with_text.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

import '../../../../assets_helper/app_colors.dart';
import '../../../../assets_helper/app_fonts.dart';
import '../../../../assets_helper/app_icons.dart';
import '../../../../common_widgets/custom_image_view.dart';
import 'widget/select_journey_item.dart';

class JournalingScreen extends StatefulWidget {
  const JournalingScreen({super.key});

  @override
  State<JournalingScreen> createState() => _JournalingScreenState();
}

class _JournalingScreenState extends State<JournalingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Journey",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c111111,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                Text("Choose a trip or create a new one to generate story", style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  color: AppColors.c454545,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),),
                UIHelper.verticalSpace(18.h),
                Column(
                  children: List.generate(4, (index) => SelectJourneyItem(
                    image: "assets/images/journeys_bg_img.png",
                    title: "Exploring Asakusa temple",
                    date: "Aug 2- Aug 10, 2025",
                  )),
                ),


                UIHelper.verticalSpace(18.h),
                DividerWithText(text: "Or"),
                UIHelper.verticalSpace(18.h),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildButton() {
    return ElevatedButton(
      onPressed: () {
        NavigationService.navigateTo(Routes.subcriptionAfterFreeScreen);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: AppColors.cFFFFFF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.r),
          side: BorderSide(color: AppColors.orangeColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Unlock full access",
            style: TextFontStyle.textStylePlusJakartaSans.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.c111111,
            ),
          ),
          UIHelper.horizontalSpace(10.w),
          CustomImageView(
            imagePath: AppIcons.buttonicon,
            color: AppColors.orangeColor,
            height: 18.h,
            width: 18.w,
          ),
        ],
      ),
    );
  }
}
