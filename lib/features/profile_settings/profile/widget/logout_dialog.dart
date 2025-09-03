import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../assets_helper/app_fonts.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.cFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                UIHelper.verticalSpace(8.h),
                // Title
                Text(
                  "Logging out?",
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c181818,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                UIHelper.verticalSpace(16.h),

                // Subtitle
                Text(
                  "Are you sure want to Log out from your account?",
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    color: AppColors.c757575,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                UIHelper.verticalSpace(24.h),

                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.orangeColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 12.h),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Cancel",
                        style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                          color: AppColors.orangeColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    // Confirm Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 12.h),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // TODO: Add your logout logic here
                      },
                      child: Text(
                        "Confirm",
                        style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                          color: AppColors.cFFFFFF,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned.fill(
              top: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: CustomImageView(
                  imagePath: AppIcons.closeRoundedIcon,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
            ),
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
        return LogoutDialog();
      },
    );
  }
}
