import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/features/create_journal_flow/place_option/widget/blank_calander.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class PlaceOptionScreen extends StatefulWidget {
  final int step;
  const PlaceOptionScreen({super.key, this.step = 3});

  @override
  State<PlaceOptionScreen> createState() => _PlaceOptionScreenState();
}

class _PlaceOptionScreenState extends State<PlaceOptionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();


  double get progress {
    return (widget.step + 0.0) / 9.0;
  }

  bool isStartDateErrVisible = false;

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArroBackbutton(
                  onTap: () => NavigationService.goBack,
                  title: '',
                ),

              ///================================= progress ======================//
              UIHelper.verticalSpace(16.h),
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

             ///============================= text ========================//
                Text(
                  "When does your trip start — and when (if at all) does it end?",
                  style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                      .copyWith(fontSize: 20.sp),
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  'Pick your starting date',
                  style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                ),
                UIHelper.verticalSpace(7.h),

       //============================= calander ===========================//
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogActivityCalander(
                      controller: startDateController,
                      hintText: 'Select start date',
                    ),

                    Visibility(
                      visible: isStartDateErrVisible,
                      child: Text("start date is required", style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cFF4842,
                      ),),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
///============================= Text =========================//
                ///
                Text(
                  'End date (optional)',
                  style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                ),
                UIHelper.verticalSpace(7.h),

      ///======================= calander ================================//
                LogActivityCalander(
                  controller: endDateController,
                  hintText: 'Select end date',
                ),
                UIHelper.verticalSpace(24.h),

     ///========================== text =====================//
                Center(
                  child: Text(
                    'You can always come back and add an end date later.',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle14w400c757575PlusJakartaSans
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

  ///========================= button ========================//
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Next',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (startDateController.text.isEmpty) {
                setState(() {
                  isStartDateErrVisible = true;
                });
              } else {
                setState(() {
                  isStartDateErrVisible = false;
                });
              }
              if (isStartDateErrVisible) {
                return;
              }
              NavigationService.navigateTo(Routes.journeyPartnerScreen);
            }
          },
        ),
      ),
    );
  }
}
