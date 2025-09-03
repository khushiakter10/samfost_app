
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/features/create_journal_flow/experience/widget/trying_local_food.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class JournalExperienceScreen extends StatefulWidget {
  final int step;
  const JournalExperienceScreen({super.key, this.step = 6});

  @override
  State<JournalExperienceScreen> createState() => _JournalExperienceScreenState();
}

class _JournalExperienceScreenState extends State<JournalExperienceScreen> {

  double get progress {
    return (widget.step + 1.7) / 9.0;
  }



  int selectedIndex = -1;

  final TextEditingController comingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    comingController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///========================== button ======================//
                CustomArroBackbutton(
                  onTap: () {
                    NavigationService.goBack;
                  },
                  title: '',
                ),
                UIHelper.verticalSpace(16.h),

                ///========================== progress =========================//
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


                ///=============================== text =======================//
                Text(
                    'Big goals or just good vibes — what’s this trip about?',
                    style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                        fontSize: 20.sp
                    )
                ),
                UIHelper.verticalSpace(12.h),


                ///============================= text field ===========================//
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: CustomTextfield(
                          controller: comingController,
                          maxline: 5,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
                          fillColor: AppColors.cF8F8F8,
                          hintText: 'What are you in it for — peace, adventure, partying, stories to tell?',
                          hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                            fontSize: 14.sp,
                            fontStyle: FontStyle.italic,
                          ),
                          borderColor: Colors.transparent,
                        ),
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



                Text(
                    'Quick suggestions:',
                    style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                ),
                UIHelper.verticalSpace(12.h),


                ///=============================== select break =================================//
                Row(
                  children: [
                    TryingLocalFood(
                      title: '✨ A break from real life',
                      isSelected: selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    UIHelper.horizontalSpace(12.h),
                    TryingLocalFood(
                      title: '🍺  Wanna party',
                      isSelected: selectedIndex == 3,
                      onTap: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),

                ///====================================== select Meeting ==============================//
                Row(
                  children: [
                    TryingLocalFood(
                      title: '💬  Meeting new people',
                      isSelected: selectedIndex == 4,
                      onTap: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      },
                    ),
                    UIHelper.horizontalSpace(12.h),
                    TryingLocalFood(
                      title: '🧘‍♀️ Time to reflect',
                      isSelected: selectedIndex == 5,
                      onTap: () {
                        setState(() {
                          selectedIndex = 5;
                        });
                      },
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),

                ///====================================== select Trying ==============================//
                Row(
                  children: [
                    TryingLocalFood(
                      title: '🍜  Trying local food',
                      isSelected: selectedIndex == 6,
                      onTap: () {
                        setState(() {
                          selectedIndex = 6;
                        });
                      },
                    ),
                    UIHelper.horizontalSpace(12.h),
                    TryingLocalFood(
                      title: '🏝️  Proper adventure',
                      isSelected: selectedIndex == 7,
                      onTap: () {
                        setState(() {
                          selectedIndex = 7;
                        });
                      },
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                ///===================================== select Healing ==============================//
                TryingLocalFood(
                  title: '🥲  Healing from something',
                  isSelected: selectedIndex == 8,
                  onTap: () {
                    setState(() {
                      selectedIndex = 8;
                    });
                  },
                ),
                UIHelper.verticalSpace(16.h),

                TryingLocalFood(
                  title: '😎  Making the most of being young',
                  isSelected: selectedIndex == 9,
                  onTap: () {
                    setState(() {
                      selectedIndex = 9;
                    });
                  },
                ),
                UIHelper.verticalSpace(16.h),
                ///========================== Making ================================//

                TryingLocalFood(
                  title: '❤️  Making memories with someone special',
                  isSelected: selectedIndex == 10,
                  onTap: () {
                    setState(() {
                      selectedIndex = 10;
                    });
                  },
                ),

                UIHelper.verticalSpace(35.h),




   ///============================ button ==========================//

                  CustomElevatedButton(
                          icon: SvgPicture.asset(AppIcons.buttonicon),
                          text: 'Next',
                          onPressed: () {
                            NavigationService.navigateTo(Routes.journalActivitesScreen);
                          },
                        ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}