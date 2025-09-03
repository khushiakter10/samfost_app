
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class NameOfTripScreen extends StatefulWidget {
  final int step;
  const NameOfTripScreen({super.key, this.step = 0});

  @override
  State<NameOfTripScreen> createState() => _NameOfTripScreenState();
}

class _NameOfTripScreenState extends State<NameOfTripScreen> {
  double get progress {
    return (widget.step + 1) / 6.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Column(
            children: [

      ///======================================== Appbar ===================================//

              CustomArroBackbutton(
                onTap: () {
                  NavigationService.goBack;
                },
                title: '',
              ),
            UIHelper.verticalSpace(16.h),

     ///==================================== Progress =====================================///
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20.r),
                  value: progress,
                  minHeight: 10,
                  backgroundColor: AppColors.cF3F3F3,
                  valueColor:
                   AlwaysStoppedAnimation<Color>(AppColors.orangeColor),
                ),
              ),
              UIHelper.verticalSpace(24.h),

       ///============================ Image ========================================//
              Image.asset(AppImages.roaddriveimage,height: 217.h,),
              UIHelper.verticalSpace(26.h),


       ///=================================== text ======================================//
              Text(
                "What's the name of your trip?",
                style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                  fontSize: 20.sp
                )
              ),
              UIHelper.verticalSpace(12.h),

///================================== textformfield ============================//
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Stack(
                  children: [
                    CustomTextfield(
                      style: TextStyle(fontSize: 18),
                      suffixIcon: Transform.scale(
                        scale: 0.60,
                          child: SvgPicture.asset(AppIcons.summericon,height: 24.h,)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
                      fillColor: AppColors.cF8F8F8,
                      hintText: 'Summer in Japan',
                      hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                      ),
                      borderColor: Colors.transparent,
                    ),

                    Positioned(
                      bottom: 0,
                      left: 3,
                      right: 3,
                      child: SizedBox(
                        height: 1,
                        child: DottedBorder(
                          dashPattern: [4, 7],
                          color: AppColors.cD1D1D1,
                          strokeWidth: 1.w,
                          padding: EdgeInsets.zero,
                          borderType: BorderType.RRect,
                          radius: Radius.zero,
                          customPath: (size) {
                            return Path()
                              ..moveTo(0, 0)
                              ..lineTo(size.width, 0);
                          },
                          child: const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(12.h),



    ///======================================== Text =========================================//
              Text(
                '(You can edit this later)',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle14w400c757575PlusJakartaSans
              ),
            ],
          ),
        ),
      ),

    ///======================================== Button =======================================//
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Next',
          onPressed: () {
            NavigationService.navigateTo(Routes.placeScreen);
          },
        ),
      ),

    );
  }
}