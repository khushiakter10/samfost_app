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




class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? _validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your current password';
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a new password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your new password';
    if (value != newPasswordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArroBackbutton(
                  onTap: (){NavigationService.goBack;},

                  title: 'Update password',),



                UIHelper.verticalSpace(40.h),

             //==================================== Current password ============================//
                Text(
                  'Current password',
                  style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextfield(
                  prefixIcon: Transform.scale(
                      scale: 0.50,
                      child: SvgPicture.asset(AppIcons.currentpsswordicon,height: 18.h)),

                  borderRadius: 8.r,
                  labelText: 'Current Password*',
                  fillColor:  AppColors.cFFFFFF,
                  hintText: '********',
                  controller: currentPasswordController,
                  isObsecure: true,
                  isPass: true,
                 validator: _validateCurrentPassword,

                ),



                //======================== New password ===================================================//

                UIHelper.verticalSpace(18.h),
                Text(
                    'New password',
                    style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextfield(
                  prefixIcon: Transform.scale(
                    scale: 0.50,
                      child: SvgPicture.asset(AppIcons.currentpsswordicon,height: 18.h)),
                  borderRadius: 8.r,
                  labelText: 'New Password*',
                  fillColor:  AppColors.cFFFFFF,
                  hintText: '********',
                  controller: newPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validateNewPassword,

                ),
                UIHelper.verticalSpace(18.h),

                 //==================================== Confirm password ==================================//

                Text(
                    'Confirm password',
                    style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextfield(
                  prefixIcon: Transform.scale(
                      scale: 0.50,
                      child: SvgPicture.asset(AppIcons.currentpsswordicon,height: 18.h)),
                  borderRadius: 8.r,
                  labelText: 'Confirm Password*',
                  fillColor:  AppColors.cFFFFFF,
                  hintText: '********',
                  controller: confirmPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validateConfirmPassword,

                ),




              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 58.h),
        child: CustomElevatedButton(
          text: 'Update Password',
          icon: SvgPicture.asset(AppIcons.buttonicon),
          onPressed: () {
            if (_formKey.currentState!.validate()) {

              NavigationService.navigateTo(Routes.notificationScreen);

            }
          },
        ),
      ),
    );
  }
}
