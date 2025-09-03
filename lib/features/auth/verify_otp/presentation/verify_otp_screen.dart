
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  bool _isResendLoading = false;
  int _resendCountdown = 59; // countdown in seconds

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _startResendCountdown() {
    if (_resendCountdown > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() => _resendCountdown--);
          _startResendCountdown();
        }
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  Future<void> _resendOtp() async {
    setState(() {
      _isResendLoading = true;
      _resendCountdown = 59;
      _otpController.clear();
    });

    try {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP resent successfully')),
      );

      _startResendCountdown();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to resend OTP: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isResendLoading = false);
      }
    }
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArroBackbutton(
                  onTap: () => NavigationService.goBack,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          'Verify OTP',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle24w600cFF6F3CPlusJakartaSans
                              .copyWith(fontSize: 24.sp),
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          'Enter an OTP sent to mail@mail.com',
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double totalWidth = constraints.maxWidth;
                              double fieldWidth = (totalWidth - 20) / 4;

                              return PinCodeTextField(
                                appContext: context,
                                length: 4,
                                controller: _otpController,
                                enablePinAutofill: true,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter OTP';
                                  } else if (value.trim().length != 4) {
                                    return 'Please enter complete 4-digit OTP';
                                  }
                                  return null;
                                },
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(8.r),
                                  fieldHeight: 64.h,
                                  fieldWidth: fieldWidth.clamp(50, 77.5),
                                  borderWidth: 2,
                                  inactiveColor: Colors.grey,
                                  selectedColor: AppColors.orangeColor,
                                  activeColor: Colors.transparent,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Color(0x33FF6F3C),
                                  activeFillColor: Color(0x33FF6F3C),
                                ),
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                enableActiveFill: true,
                                textStyle: TextFontStyle.textStyle14w500c242424.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                beforeTextPaste: (text) => false,
                              );
                            },
                          ),
                        ),

                        CustomElevatedButton(
                          icon: SvgPicture.asset(AppIcons.buttonicon),
                          text: 'Continue',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              NavigationService.navigateTo(Routes.resetPasswordScreen);
                            }
                          },
                        ),
                        UIHelper.verticalSpace(24.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatTime(_resendCountdown), // dynamic countdown
                              textAlign: TextAlign.center,
                              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                                color: const Color(0xFF757575),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                            GestureDetector(
                              onTap: _isResendLoading || _resendCountdown > 0
                                  ? null
                                  : _resendOtp,
                              child: Text(
                                'Resend OTP',
                                textAlign: TextAlign.center,
                                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                                  color: _resendCountdown > 0
                                      ? Colors.grey
                                      : const Color(0xFF757575),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,

                                ),
                              ),
                            ),
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
    );
  }
}

