import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../assets_helper/app_fonts.dart';

class FeedbackDialog extends StatelessWidget {
  const FeedbackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.cFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CustomImageView(
                imagePath: AppIcons.closeRoundedIcon,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),

            UIHelper.verticalSpace(8.h),
            // Title
            Text(
              "Enjoying Journey Jotter?",
              // textAlign: TextAlign.center,
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                color: AppColors.c0A2540,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            UIHelper.verticalSpace(12.h),

            // Subtitle
            Text(
              "Please let us know how you feel about our app",
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                color: AppColors.c757575,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            UIHelper.verticalSpace(12.h),

            RatingBar(
              initialRating: 3.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: CustomImageView(imagePath: AppIcons.fullStarIcon),
                half: CustomImageView(imagePath: AppIcons.halfStarIcon),
                empty: CustomImageView(imagePath: AppIcons.emptyStarIcon),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),

            UIHelper.verticalSpace(18.h),

            // Buttons Row
            CustomElevatedButton(
              onPressed: () {
                NavigationService.navigateTo(Routes.errorScreen);
              },
              text: "Submit",
              icon: CustomImageView(
                imagePath: AppIcons.buttonicon,
              ),
            )
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return FeedbackDialog();
      },
    );
  }
}
