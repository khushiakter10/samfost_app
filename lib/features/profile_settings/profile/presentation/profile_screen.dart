import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/features/other/presentation/feedback_dialog.dart';
import 'package:samfost_app/features/profile_settings/profile/widget/logout_dialog.dart';
import 'package:samfost_app/features/profile_settings/profile/widget/profile_card_section.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../eidt_personal_information/presentation/eidt_personal_information_screen.dart';
import '../../eidt_personal_information/widget/controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FeedbackDialog.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFBF9,
      body: SafeArea(
        child: Column(
          children: [
            //---------------------------------- Profile Section --------------------------------------------------//
            Obx(() {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                           backgroundColor: AppColors.cFFFFFF,
                          child: controller.profileImage.value == null
                              ? CustomImageView(imagePath: AppImages.profileimage,)
                              : ClipOval(
                            child: Image.file(
                              File(controller.profileImage.value!.path),
                              width: 139.w,
                              height: 130.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(16.h),
                    Text(
                      controller.name.value,
                      style: TextFontStyle.textStyle20w600c1C1D20PlusJakartaSans,
                    ),
                    Text(
                      controller.email.value,
                      style: TextFontStyle.textStyle16w400c888E9CPlusJakartaSans,
                    ),
                  ],
                ),
              );
            }),



            //---------------------------------------- Subscription Section ----------------------------------//


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.all(12.sp),
                      width: double.infinity,
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        border: Border.all(color: AppColors.cFFFFFF, width: 2.w),
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 16,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Subscription status',
                            style:
                            TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans,
                          ),
                          UIHelper.verticalSpace(16.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/icons/crediticon.svg'),

                              UIHelper.horizontalSpace(8.w),

                              Text(
                                'Premium plan',
                                style: TextFontStyle
                                    .textStyle18w600c181818PlusJakartaSans,
                              ),
                              Spacer(),

                              SvgPicture.asset('assets/icons/activeicon.svg'),
                              UIHelper.horizontalSpace(8.w),
                              Text(
                                'Active',
                                style: TextFontStyle
                                    .textStyle14w400c34A853PlusJakartaSans,
                              ),
                            ],
                          ),

                          UIHelper.verticalSpace(8.h),

                          Text(
                            'Next billing date: June 30, 2025',
                            style:
                            TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                          ),
                          UIHelper.verticalSpace(16.h),

                          CustomElevatedButton(
                            icon: SvgPicture.asset(AppIcons.sendicon,height: 28,),
                            text: "Manage subscription",
                            onPressed: () {
                              NavigationService.navigateTo(Routes.subcriptionAfterFreeScreen);

                            },
                          ),
                        ],
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.all(12.sp),
                      width: double.infinity,
                      padding:  EdgeInsets.all(16.sp),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                              'Account settings',
                              style: TextFontStyle.textStyle16w600c1C1D20Manrope
                          ),

                          ProfileCardSection(
                              text: 'Edit personal Iinfo',
                              callback: () {
                                Get.to(() => EditPersonalInformationScreen());
                              },
                              icon: SvgPicture.asset(AppIcons.lockicon, height: 24.h)
                          ),

                          UIHelper.verticalSpace(16.h),
                          ProfileCardSection(
                              text: 'Update password',
                              callback: () {
                                NavigationService.navigateTo(Routes.updatePasswordScreen);
                              },
                              icon: SvgPicture.asset(AppIcons.password, height: 24.h)
                          ),

                          UIHelper.verticalSpace(16.h),
                          ProfileCardSection(
                              text: 'Notification settings',
                              callback: () {
                                NavigationService.navigateTo(Routes.notificationScreen);
                              },
                              icon: SvgPicture.asset(AppIcons.notification, height: 24.h)
                          ),
                          UIHelper.verticalSpace(16.h),
                          Divider(
                            color: AppColors.cFFEDE6,
                            height: 1.h,
                          ),
                          UIHelper.verticalSpace(24.h),
                          Text(
                              'Support',
                              style: TextFontStyle.textStyle16w600c1C1D20Manrope
                          ),
                          UIHelper.verticalSpace(16.h),

                          ProfileCardSection(
                              text: 'Help center',
                              callback: () {
                                NavigationService.navigateTo(Routes.helperCenterScreen);
                              },
                              icon: SvgPicture.asset(AppIcons.qustionicon, height: 24.h)
                          ),
                          UIHelper.verticalSpace(16.h),
                          ProfileCardSection(
                              text: 'Privacy policy',
                              callback: () {},
                              icon: SvgPicture.asset(AppIcons.clockicon, height: 24.h)
                          ),
                          UIHelper.verticalSpace(16.h),
                          Divider(
                            color: AppColors.cFFEDE6,
                            height: 1.h,
                          ),
                          UIHelper.verticalSpace(24.h),
                          ProfileCardSection(
                              text: 'Log out',
                              callback: () {
                                LogoutDialog.show(context);
                              },
                              icon: SvgPicture.asset(AppIcons.logouticon, height: 24.h)
                          ),
                          UIHelper.verticalSpace(24.h),
                          ProfileCardSection(
                              text: 'Delete account',
                              callback: () {
                                NavigationService.navigateTo(Routes.deleteAccountScreen);
                              },
                              icon: SvgPicture.asset(AppIcons.deleteicon, height: 24.h)
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
    );
  }
}








