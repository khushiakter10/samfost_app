import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class ManualJournalScreen extends StatefulWidget {
  const ManualJournalScreen({super.key});

  @override
  State<ManualJournalScreen> createState() => _ManualJournalScreenState();
}

class _ManualJournalScreenState extends State<ManualJournalScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController tripController = TextEditingController();
  final TextEditingController journalController = TextEditingController();

  @override
  void dispose() {
    tripController.dispose();
    journalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF8F5F2,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArroBackbutton(
                  onTap: () {
                    NavigationService.goBack;
                  },
                  title: '',
                ),
                UIHelper.verticalSpace(12.h),


                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.calandericon, height: 24.h),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              'Tuesday, August 2',
                              style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                                  .copyWith(fontSize: 16.sp,fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(8.h),

                        Text(
                          "What's the name of your trip?",

                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                              .copyWith(fontSize: 20.sp,fontWeight: FontWeight.w600),
                        ),

                        UIHelper.verticalSpace(12.h),


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
                                  controller: tripController,
                                  suffixIcon: Transform.scale(
                                    scale: 0.60,
                                    child: SvgPicture.asset(
                                      AppIcons.summericon,
                                      height: 24.h,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
                                  fillColor: AppColors.cF8F8F8,
                                  hintText: 'Summer in Japan',
                                  hintTextSyle: TextFontStyle
                                      .textStyle14w400c757575PlusJakartaSans
                                      .copyWith(
                                    fontSize: 16.sp,
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
                        UIHelper.verticalSpace(18.h),


                        Text(
                          'Your journal',
                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                              .copyWith(fontSize: 20.sp,fontWeight: FontWeight.w600),
                        ),
                        UIHelper.verticalSpace(12.h),


                        CustomTextfield(
                          controller: journalController,
                          borderRadius:18.r ,
                          maxline: 8,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 18.h,
                          ),
                          fillColor: AppColors.cF8F8F8,
                          hintText: 'Alright storyteller - what happened today?',
                          hintTextSyle: TextFontStyle.textStyle14c8C8C8CPoppinsw400,


                          borderColor: AppColors.cD1D1D1,
                        ),
                        UIHelper.verticalSpace(12.h),

                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.photosgelaryicon, height: 24.h),
                            UIHelper.horizontalSpace(12.w),
                            SvgPicture.asset(AppIcons.journalimoji, height: 24.h),

                            Spacer(),

                            Text(
                              '0 words',style: TextFontStyle.textStyle14c8C8C8CPoppinsw400,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(24.h),

                        CustomElevatedButton(
                          icon: SvgPicture.asset(AppIcons.buttonicon),
                          text: 'Save',
                          onPressed: () {
                            NavigationService.navigateTo(Routes.jornalThreeGenaretAiStoryScreen);
                          },
                        ),
                        UIHelper.verticalSpace(24.h),


                        Container(
                          width: double.infinity,
                          padding:  EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 24.h,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1E000000),
                                blurRadius: 16,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                '✨ Want smarter prompts and journal summaries?',
                                textAlign: TextAlign.center,
                                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(fontWeight: FontWeight.w600,fontSize: 18.sp)
                              ),
                              UIHelper.verticalSpace(12.h),

                              CustomElevatedButton(
                                text: 'Upgrade to JJ+ anytime.',
                                onPressed: () {
                                  NavigationService.navigateTo(Routes.subcriptionAfterFreeScreen);
                                },
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
