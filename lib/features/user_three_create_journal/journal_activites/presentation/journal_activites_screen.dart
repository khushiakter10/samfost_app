
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
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class JournalActivitesScreen extends StatefulWidget {
  final int step;
  const JournalActivitesScreen({super.key, this.step = 4});

  @override
  State<JournalActivitesScreen> createState() => _JournalActivitesScreenState();
}

class _JournalActivitesScreenState extends State<JournalActivitesScreen> {

  double get progress {
    return (widget.step + 0.5) / 5.0;
  }

  final TextEditingController activeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    activeController.dispose();
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
                ///======================== button =======================//

                CustomArroBackbutton(
                  onTap: () {
                    NavigationService.goBack;
                  },
                  title: '',
                ),
                UIHelper.verticalSpace(16.h),

                ///======================== progress =========================//
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


                ///============================= text =========================//
                Text(
                    "What are you most excited\nto do on this trip?",
                    style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                      fontSize: 24.sp,

                    )
                ),
                UIHelper.verticalSpace(12.h),

                Text(
                    'Could be anything from hiking volcanoes to sipping margaritas.',
                    style: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                      fontSize: 16.sp,
                    )
                ),
                UIHelper.verticalSpace(18.h),
                ///=================================== textformfield ==========================//
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
                          controller: activeController,
                          maxline: 5,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
                          fillColor: AppColors.cF8F8F8,
                          hintText: 'Type anything—from epic hikes to weird museums to rooftop bars…',
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


                ///============================== button ============================//
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:   Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Continue',
          onPressed: () {
            NavigationService.navigateTo(Routes.journalConfirmationScreen);
          },
        ),
      ),
    );
  }
}