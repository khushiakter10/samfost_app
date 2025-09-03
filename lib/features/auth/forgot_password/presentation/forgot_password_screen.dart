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


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
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


               UIHelper.verticalSpace(190.h),
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
                          'Forgot password',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans
                              .copyWith(fontSize: 24.sp),
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          'Enter your email to reset your password.',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                        ),
                        UIHelper.verticalSpace(24.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans,
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),
                        CustomTextfield(
                          fillColor: Colors.white,
                          controller: emailController,
                          prefixIcon: Transform.scale(
                            scale: 0.50,
                            child: SvgPicture.asset(
                              AppIcons.emailicon,
                              height: 18.h,
                            ),
                          ),
                          hintText: 'Enter your email here',
                          hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans
                              .copyWith(fontSize: 12.sp),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        UIHelper.verticalSpace(24.h),
                        CustomElevatedButton(
                          icon: SvgPicture.asset(AppIcons.buttonicon),
                          text: 'Send OTP',
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              NavigationService.navigateTo(Routes.verifyOtpScreen);
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


