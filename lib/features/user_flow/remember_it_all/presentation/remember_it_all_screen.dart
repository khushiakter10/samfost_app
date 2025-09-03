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


class RememberItAllScreen extends StatelessWidget {
  const RememberItAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Column(
            children: [
              CustomArroBackbutton(
                onTap: () {
                  NavigationService.goBack;
                },
                title: '',
              ),

               Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       Image.asset(AppImages.rememberimage, height: 327.h),
                       Text(
                         'This is how you’ll\nremember it all.',
                         textAlign: TextAlign.center,
                         style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                             .copyWith(fontSize: 24.sp),
                       ),
                       UIHelper.verticalSpace(12.h),
                       Text(
                         'From chaotic nights to quiet reflections, JJ helps you capture it all in your voice. Just a few minutes a day, and your wildest stories turn into memories you’ll actually remember.,',

                         textAlign: TextAlign.center,
                         style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                             .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
                       ),
                       UIHelper.verticalSpace(12.h),

                       Text(
                         'Fun, effortless, and always sounding like you.',
                         textAlign: TextAlign.center,
                         style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                             .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
                       ),
                       UIHelper.verticalSpace(35.h),
                       CustomElevatedButton(
                         icon: SvgPicture.asset(AppIcons.buttonicon),
                         text: 'Nearly there!',
                         onPressed: () {
                           NavigationService.navigateTo(Routes.userReminderScreen);
                         },
                       ),

                     ],
                   ),
                 ),
               ),

            ],
          ),
        ),
      ),
    );
  }
}
