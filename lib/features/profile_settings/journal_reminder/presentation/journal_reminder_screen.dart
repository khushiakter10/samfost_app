import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class JournalReminderScreen extends StatefulWidget {
  const JournalReminderScreen({super.key});

  @override
  State<JournalReminderScreen> createState() => _JournalReminderScreenState();
}

class _JournalReminderScreenState extends State<JournalReminderScreen> {
  bool isOf = false;
  bool isOn = false;

  TimeOfDay? morningTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay? eveningTime = const TimeOfDay(hour: 19, minute: 0);

  String formatTime(TimeOfDay? time) {
    if (time == null) return "--:--";
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }
  Future<void> pickMorningTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: morningTime ?? const TimeOfDay(hour: 9, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.cFFFFFF,
              dialHandColor: AppColors.orangeColor,
              hourMinuteTextColor: AppColors.orangeColor,
              hourMinuteColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                    ? AppColors.cFFF4EF
                    : Colors.grey.shade200,
              ),
              dayPeriodColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                    ? AppColors.orangeColor
                    : Colors.grey.shade200,
              ),
              entryModeIconColor: AppColors.orangeColor,
            ),
            colorScheme: ColorScheme.light(
              primary: AppColors.orangeColor,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (picked.hour >= 5 && picked.hour < 12) {
        setState(() => morningTime = picked);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a valid morning time (5 AM - 11:59 AM).")),
        );
      }
    }
  }

  Future<void> pickEveningTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: eveningTime ?? const TimeOfDay(hour: 19, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,
              dialHandColor: AppColors.orangeColor,
              hourMinuteTextColor: AppColors.orangeColor,
              hourMinuteColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                    ? AppColors.cFFF4EF
                    : Colors.grey.shade200,
              ),
              dayPeriodColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                    ? AppColors.orangeColor
                    : Colors.grey.shade200,
              ),
              entryModeIconColor: AppColors.orangeColor,
            ),
            colorScheme: ColorScheme.light(
              primary: AppColors.orangeColor,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (picked.hour >= 17 && picked.hour <= 22) {
        setState(() => eveningTime = picked);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a valid evening time (5 PM - 10 PM).")),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomArroBackbutton(
                  onTap: (){NavigationService.goBack;},
                  title: ''),
              UIHelper.verticalSpace(12.h),

              Text(
                'Let s keep the unforgettable... unforgettable.',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                "Want a gentle reminder to capture the\nday's moments? Set a time that suits your vibe and we’ll do the rest.",
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              UIHelper.verticalSpace(40.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Morning Reminder
                  Column(
                    children: [
                      Image.asset(AppImages.morningremender, height: 48.h),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        'Morning reminder',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                      ),
                      UIHelper.verticalSpace(2.h),
                      Text(
                        'Reflect over\n coffee',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                      ),
                      UIHelper.verticalSpace(16.h),

                      GestureDetector(
                        onTap: pickMorningTime,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          decoration: ShapeDecoration(
                            color: AppColors.cFFF4EF,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                          ),
                          child: Text(
                            formatTime(morningTime),
                            textAlign: TextAlign.center,
                            style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),

//================================ Toggle Switch =================================//
                      Transform.scale(
                        origin: const Offset(1, 2),
                        scale: 0.99,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            switchTheme: SwitchThemeData(
                              thumbColor: WidgetStateProperty.resolveWith<Color>(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.cFFFFFF;
                                  }
                                  return AppColors.cFFFFFF;
                                },
                              ),
                              trackColor: WidgetStateProperty.resolveWith<Color>(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.orangeColor; // track when ON
                                  }
                                  return AppColors.cD9DDE0;
                                },
                              ),
                              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                            ),
                          ),
                          child: Switch(
                            value: isOf,
                            onChanged: (bool value) {
                              setState(() => isOf = value);
                            },
                          ),
                        ),
                      ),

                    ],
                  ),

                  Container(
                    height: 200,
                    width: 1,
                    color: AppColors.cE8E8E8,
                  ),

                  /// Evening Reminder
                  Column(
                    children: [
                      Image.asset(AppImages.eveningRemender, height: 48.h),
                      UIHelper.verticalSpace(12.h),
                      Text(
                        'Evening reminder',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                      ),
                      UIHelper.verticalSpace(2.h),
                      Text(
                        'Catch the chaos\nbefore bed',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                      ),
                      UIHelper.verticalSpace(16.h),

                      GestureDetector(
                        onTap: pickEveningTime,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          decoration: ShapeDecoration(
                            color: AppColors.cFFF4EF,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                          ),
                          child: Text(
                            formatTime(eveningTime),
                            textAlign: TextAlign.center,
                            style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(12.h),

                      //========================== Toggle Switch ==================================//

                      Transform.scale(
                        scale: 0.99,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            switchTheme: SwitchThemeData(
                              thumbColor: WidgetStateProperty.resolveWith<Color>(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.cFFFFFF;
                                  }
                                  return AppColors.cFFFFFF;
                                },
                              ),
                              trackColor: WidgetStateProperty.resolveWith<Color>(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.orangeColor;
                                  }
                                  return AppColors.cD9DDE0;
                                },
                              ),
                              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                            ),
                          ),
                          child: Switch(
                            value: isOn,
                            onChanged: (bool value) {
                              setState(() => isOn = value);
                            },
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
              UIHelper.verticalSpace(180.h),
              CustomElevatedButton(
                text: 'Set reminders',
                icon: SvgPicture.asset(AppIcons.buttonicon),
                onPressed: () {
                  NavigationService.navigateTo(Routes.subscriptionPopUpScreen);
                },
              ),
              UIHelper.verticalSpace(18.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Maybe later',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.textStyle16w500c454545PlusJakartaSans
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
