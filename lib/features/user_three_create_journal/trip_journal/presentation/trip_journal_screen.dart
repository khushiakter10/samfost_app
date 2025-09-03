import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';



class TripJournalScreen extends StatelessWidget {
  const TripJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          child: Column(
            children: [

              //================================== appbar ===============================//

              CustomArroBackbutton(
                  text: '',
                  onTap: (){NavigationService.goBack;},
                  title: ''),

              //=========================== Image ==========================//

              Image.asset(AppImages.createimage, height: 327.h),
              UIHelper.verticalSpace(18.h),
              Text(
                'Let’s set up your trip',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                    .copyWith(fontSize: 24.sp),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                'This helps us tailor your prompts and capture what really matters on your trip',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),

              ),
              //================================== Button ==================================//
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 55.h),

        child:  CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Next', onPressed: () {
          NavigationService.navigateTo(Routes.nameOfTripJournalScreen);
        },),
      ),
    );
  }
}
