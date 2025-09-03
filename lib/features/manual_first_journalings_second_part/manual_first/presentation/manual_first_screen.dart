import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class ManualFirstScreen extends StatefulWidget {
  const ManualFirstScreen({super.key});

  @override
  State<ManualFirstScreen> createState() => _ManualFirstScreenState();
}

class _ManualFirstScreenState extends State<ManualFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.memorysavedbacroundimage),fit: BoxFit.cover)
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///========================= image ==========================//

                  Image.asset(AppImages.boomjornyimage,height: 327.h),
                  UIHelper.verticalSpace(24.h),

                  ///======================= text ======================//
                  Text(
                      'Boom — first\nmemory saved!',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                          fontSize: 32.sp
                      )
                  ),
                  UIHelper.verticalSpace(12.h),
                  Text(
                      "Your day’s story is now tucked safely away.\nKeep going to build your journey!",


                      textAlign: TextAlign.center,
                      style:  TextFontStyle.textStyle16w500c000000PlusJakartaSans
                  ),
                  UIHelper.verticalSpace(24.h),

                  ///=================================== Journal button =======================//

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color:  Color(0x33FF6F3C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Text(
                                'Journal streak: 1 day',
                                style:  TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(fontWeight: FontWeight.w600)
                            ),
                            UIHelper.horizontalSpace(8.w),
                            SvgPicture.asset(AppIcons.checkbox,height: 24.h,)

                          ],
                        ),
                      ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(104.h),


                  ///=============================== button ==================================//
                  CustomElevatedButton(
                    icon: SvgPicture.asset(AppIcons.buttonicon),
                    text: 'Read your first journal',
                    onPressed: () {
                      NavigationService.navigateTo(Routes.aiThreeMenuallyJournalStoryScreen);
                    },
                  ),



                ],
              ),
            ),
          ),
        )
    );
  }
}
