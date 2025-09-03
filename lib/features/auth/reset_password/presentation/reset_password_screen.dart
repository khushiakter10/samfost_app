
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController setPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    setPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.memorysavedbacroundimage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomArroBackbutton(
                    onTap: () {
                      NavigationService.goBack();
                    },
                    title: '',
                  ),

                  UIHelper.verticalSpace(200.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.sp),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          'Reset password',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans
                              .copyWith(fontSize: 24.sp),
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          'Create your new password',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                        ),
                        UIHelper.verticalSpace(24.h),

                        // Set Password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Set Password',
                            style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans,
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),

                        CustomTextfield(
                          fillColor: Colors.white,
                          controller: setPasswordController,
                          prefixIcon: Transform.scale(
                            scale: 0.50,
                            child: SvgPicture.asset(
                              AppIcons.resetclockicon,
                              height: 18.h,
                            ),
                          ),
                          hintText: 'Enter your password',
                          hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans
                              .copyWith(fontSize: 12.sp),
                          keyboardType: TextInputType.text,
                          isObsecure: true, // initially hidden
                          isPass: true,     // auto add toggle eye icon
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),

                        UIHelper.verticalSpace(24.h),

                        // Confirm Password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm Password',
                            style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans,
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),

                        CustomTextfield(
                          fillColor: Colors.white,
                          controller: confirmPasswordController,
                          prefixIcon: Transform.scale(
                            scale: 0.50,
                            child: SvgPicture.asset(
                              AppIcons.resetclockicon,
                              height: 18.h,
                            ),
                          ),
                          hintText: 'Re-enter your password',
                          hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans
                              .copyWith(fontSize: 12.sp),
                          keyboardType: TextInputType.text,
                          isObsecure: true,
                          isPass: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password is required';
                            } else if (value != setPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),

                        UIHelper.verticalSpace(24.h),

                        CustomElevatedButton(
                          icon: SvgPicture.asset(AppIcons.buttonicon),
                          text: 'Reset Password',
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              NavigationService.navigateTo(Routes.passwordChangedScreen);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
