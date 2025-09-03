import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';



class JournalMemoryScreen extends StatefulWidget {
  const JournalMemoryScreen({super.key});

  @override
  State<JournalMemoryScreen> createState() => _JournalMemoryScreenState();
}

class _JournalMemoryScreenState extends State<JournalMemoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.journybacroundimage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.boomjornyimage, height: 327.h),
                  UIHelper.verticalSpace(24.h),

                  Text(
                    'Boom — first\nmemory saved!',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(fontSize: 32.sp)
                  ),
                  UIHelper.verticalSpace(12.h),
                  Text(
                    "Your day’s story is now tucked safely away keep going to build your journey!",
                    textAlign: TextAlign.center,
                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                  ),
                  UIHelper.verticalSpace(24.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0x33FF6F3C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Journal streak: 1 day', style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                            ),
                            UIHelper.horizontalSpace(8.w),
                            SvgPicture.asset(AppIcons.signetureicon,color: AppColors.orangeColor,height: 24.h,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(35.h),

                  CustomElevatedButton(
                    icon: SvgPicture.asset(AppIcons.buttonicon,height: 24,),
                      text: 'Read your first journal', onPressed: (){
                      NavigationService.navigateTo(Routes.jornalAiChartScreen);

                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

