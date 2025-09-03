
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


class ManualFirstJournalScreen extends StatefulWidget {
  const ManualFirstJournalScreen({super.key});

  @override
  State<ManualFirstJournalScreen> createState() => _ManualFirstJournalScreenState();
}

class _ManualFirstJournalScreenState extends State<ManualFirstJournalScreen> {

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

                        Text(
                          'No worries — you can still capture today’s memories your way. Just type them out below like a normal journal and we’ll save it all for you.',
                          style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                              .copyWith(fontSize: 18.sp),
                        ),
                        UIHelper.verticalSpace(10.h),
                        Divider(height: 1, color: AppColors.cE8E8E8),
                        UIHelper.verticalSpace(12.h),

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

                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.planeIcon,height: 22.h,),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                              'Tuesday, August 2',
                              style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                                  .copyWith(fontSize: 20.sp,fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(12.h),
                        Divider(height: 1, color: AppColors.cE8E8E8),
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
                            NavigationService.navigateTo(Routes.manualFirstScreen);
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
                                  NavigationService.navigateTo(Routes.subscriptionScreen);
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
