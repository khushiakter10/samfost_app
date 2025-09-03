import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/features/auth/login/widget/google_widget.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

import '../../../../common_widgets/custom_elevated_button.dart' show CustomElevatedButton;




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  bool rememberMe = false;

  void _login() {


    if (_formKey.currentState!.validate()) {

      NavigationService.navigateToReplacement(Routes.introProfileSetupScreen);
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(const SnackBar(content: Text("Login Successful")));
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cEAFCEE,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bacroundimageloging),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Start your journey',
                          style: TextFontStyle
                              .textStyle24w600cFF6F3CPlusJakartaSans,
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          textAlign: TextAlign.center,
                          'Create an account to start saving your\ntravel memories.',
                          style: TextFontStyle
                              .textStyle14w400c757575PlusJakartaSans,
                        ),
                        UIHelper.verticalSpace(24.h),

                        Row(
                          children: [
                            Text(
                              'Full Name',
                              style: TextFontStyle
                                  .textStyle14w500c6C7278PlusJakartaSans,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(4.h),

                        CustomTextfield(
                          fillColor: AppColors.cFFFFFF,
                          controller:nameController,
                          prefixIcon: Transform.scale(
                            scale: 0.45,
                            child: SvgPicture.asset(
                              AppIcons.enternameicon,
                              height: 18.h,
                            ),
                          ),
                          hintText: 'Enter your name here',
                          hintTextSyle: TextFontStyle
                              .textStyle14w400c757575PlusJakartaSans
                              .copyWith(fontSize: 12.sp),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your full name';
                            }
                            if (value.trim().length < 3) {
                              return 'Name must be at least 3 characters';
                            }
                            return null;
                          },
                        ),
                        UIHelper.verticalSpace(16.h),
                        //======================== Email ==============================//
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: TextFontStyle
                                  .textStyle14w500c6C7278PlusJakartaSans,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(4.h),
                        CustomTextfield(
                          fillColor: AppColors.cFFFFFF,
                          controller: emailController,
                          prefixIcon: Transform.scale(
                            scale: 0.45,
                            child: SvgPicture.asset(
                              AppIcons.emailicon,
                              height: 18.h,
                            ),
                          ),
                          hintText: 'Enter your email here',
                          hintTextSyle: TextFontStyle
                              .textStyle14w400c757575PlusJakartaSans
                              .copyWith(fontSize: 12.sp),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        UIHelper.verticalSpace(16.h),

                        //===================================== Password ========================================//
                        Row(
                          children: [
                            Text(
                              'Set Password',
                              style: TextFontStyle
                                  .textStyle14w500c6C7278PlusJakartaSans,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(4.h),


                        CustomTextfield(
                          fillColor: AppColors.cFFFFFF,
                          isPass: true,
                          isObsecure: true,
                          controller: passwordController,
                          prefixIcon: Transform.scale(
                            scale: 0.44,
                            child: SvgPicture.asset(
                              AppIcons.currentpsswordicon,
                              height: 18.h,
                            ),
                          ),
                          hintText: '*******',
                          hintTextSyle: TextFontStyle
                              .textStyle16w500c000000PlusJakartaSans
                              .copyWith(fontSize: 14.sp),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                       UIHelper.verticalSpace(10.h),

                        //================================= Checkbox ==========================================//
                        FormField<bool>(
                          builder: (state) {
                            return Column(

                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      side: BorderSide(color: AppColors.c6C7278,width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3.r),
                                      ),
                                      activeColor: AppColors.orangeColor,
                                      value: rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value ?? false;
                                          state.didChange(value);
                                        });
                                      },
                                    ),

                                    Text(
                                      'Remember me',
                                      style: TextFontStyle
                                          .textStyle14w500c6C7278PlusJakartaSans
                                          .copyWith(fontSize: 12.sp),
                                    ),

                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          NavigationService.navigateTo(
                                              Routes.forgotPasswordScreen);
                                        },
                                        child: Text(
                                            'Forgot Password ?',
                                            style: TextFontStyle
                                                .textStyle12w600c0A2540PlusJakartaSans
                                                .copyWith(
                                                fontSize: 12.sp
                                            )
                                        )
                                    )
                                  ],
                                ),
                                if (state.hasError)
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText!,
                                      style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                                        color: Colors.red,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        UIHelper.verticalSpace(15.h),

                        //=========================================== Lets go =======================================//
                        CustomElevatedButton(
                          onPressed: _login,
                          icon: SvgPicture.asset(
                            AppIcons.buttonicon,
                            height: 18.h,
                          ),
                          text: 'Let’s go',
                        ),
                        UIHelper.verticalSpace(24.h),

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: AppColors.cD1D1D1,
                              ),
                            ),
                            UIHelper.horizontalSpace(16.w),
                            Text(
                              'Or',
                              style: TextFontStyle
                                  .textStyle14w500c6C7278PlusJakartaSans
                                  .copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                              ),
                            ),
                            UIHelper.horizontalSpace(16.w),
                            Expanded(
                              child: Divider(
                                height: 1.h,
                                color: AppColors.cD1D1D1,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(24.h),

                        GoogleWidget(
                          icon: SvgPicture.asset(
                            AppIcons.googleicon,
                            height: 18.h,
                          ),
                          text: ' Sign in with Google',
                        ),
                        UIHelper.verticalSpace(24.h),
                        GoogleWidget(
                          icon: SvgPicture.asset(
                            AppIcons.appleicon,
                            height: 18.h,
                          ),
                          text: ' Sign in with Google',
                        ),
                        UIHelper.verticalSpace(24.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Already have an account?',
                                style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans.copyWith(
                                  fontSize: 12.sp,
                                  fontFamily: 'Inter',
                                )
                            ),
                            UIHelper.horizontalSpace(6.w),

                            GestureDetector(
                              onTap:( ){
                                NavigationService.navigateTo(Routes.loginScreen);

                              },
                              child: Text(
                                  'Login',
                                  style:  TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                                    fontFamily: 'Inter',
                                  )
                              ),
                            )
                          ],
                        )
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
