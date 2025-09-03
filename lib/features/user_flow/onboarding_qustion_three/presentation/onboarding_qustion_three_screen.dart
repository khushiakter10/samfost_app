
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



class OnboardingQustionThreeScreen extends StatefulWidget {
  final int step;

  const OnboardingQustionThreeScreen({super.key, this.step = 3});

  @override
  State<OnboardingQustionThreeScreen> createState() =>
      _OnboardingQustionThreeScreenState();
}

class _OnboardingQustionThreeScreenState
    extends State<OnboardingQustionThreeScreen> {
  List<int> selectedIndexes = [];
  bool showRequired = false;

  double get progress {
    switch (widget.step) {
      case 1:
        return 0.33;
      case 2:
        return 0.66;
      case 3:
        return 0.9;
      default:
        return 0.0;
    }
  }

  final List<String> titles = [
    'Funny or chaotic moments',
    'Deep, reflective thoughts',
    'People I meet',
    'Food I try',
    'Places I see',
    'I want to remember everything'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomArroBackbutton(
                onTap: (){NavigationService.goBack;},
                title: '',),


              UIHelper.verticalSpace(16.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20.r),
                  value: progress,
                  minHeight: 10,
                  backgroundColor: AppColors.cF3F3F3,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.orangeColor),
                ),
              ),
              UIHelper.verticalSpace(16.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Linear Progress Indicator


                      Text(
                        'What types of memories matter most to you?',
                        style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                            .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w600),
                      ),
                      UIHelper.verticalSpace(12.h),
                      Text(
                          'Select all that apply',
                          style: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                              fontSize: 16.sp,fontWeight: FontWeight.w400
                          )

                      ),
                      UIHelper.verticalSpace(18.h),

                      // Selectable Options List (Multi-select)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: titles.length,
                        separatorBuilder: (_, __) => UIHelper.verticalSpace(24.h),
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndexes.contains(index);

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedIndexes.remove(index);
                                } else {
                                  selectedIndexes.add(index);
                                }
                                showRequired = false;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              decoration: ShapeDecoration(
                                color: isSelected ? AppColors.cFFF1EC : AppColors.cFAFAFB,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: isSelected ? AppColors.cFF6F3C : AppColors.cE8E8E8,
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                        titles[index],
                                        style: TextFontStyle.textStyle16w400c0A2540Poppins
                                    ),
                                  ),
                                  Container(
                                    width: 24.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48.r),
                                      border: isSelected ? null : Border.all(color: AppColors.cBABABA, width: 2),
                                    ),
                                    child: isSelected
                                        ? Center(
                                      child: Image.asset(
                                        AppImages.succsessimage,
                                        width: 24.w,
                                        height: 24.h,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Required Text
                      if (showRequired)
                        Text(
                          "Please select an option to continue",
                          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                            color: Colors.red,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),



                      UIHelper.verticalSpace(50.h),
                      CustomElevatedButton(
                        icon: SvgPicture.asset(AppIcons.buttonicon),
                        text: widget.step < 3 ? '' : 'Continue',
                        onPressed: () {
                          if (selectedIndexes.isEmpty) {
                            setState(() {
                              showRequired = true;
                            });
                          } else {
                            NavigationService.navigateTo(Routes.rememberItAllScreen);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

