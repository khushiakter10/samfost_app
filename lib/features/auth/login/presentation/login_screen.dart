
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/features/auth/login/widget/google_widget.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful")),
      );
      NavigationService.navigateToReplacement(Routes.homeScreen);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  UIHelper.verticalSpace(50.h),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get started now',
                                style: TextFontStyle
                                    .textStyle24w600cFF6F3CPlusJakartaSans,
                              ),
                            ],
                          ),

                          UIHelper.verticalSpace(8.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign in to start capturing memories now.',
                                style: TextFontStyle
                                    .textStyle14w400c757575PlusJakartaSans,
                              ),
                            ],
                          ),

                          UIHelper.verticalSpace(24.h),

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
                                .textStyle14w400c757575PlusJakartaSans,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
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
                                'Password',
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
                                .textStyle14w400c757575PlusJakartaSans,
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
                                'Don’t have an account?',
                                style: TextFontStyle
                                    .textStyle14w500c6C7278PlusJakartaSans
                                    .copyWith(
                                  fontSize: 12.sp,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              UIHelper.horizontalSpace(6.w),
                              GestureDetector(
                                onTap: () {
                                  NavigationService.navigateTo(
                                      Routes.signUpScreen);
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextFontStyle
                                      .textStyle12w600c0A2540PlusJakartaSans
                                      .copyWith(
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
