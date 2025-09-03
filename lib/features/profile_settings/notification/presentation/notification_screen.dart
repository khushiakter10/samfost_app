import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {



  bool isOf = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              CustomArroBackbutton(
                onTap: (){NavigationService.goBack;},
                  title: 'Notification'),
             UIHelper.verticalSpace(30.h),

          Container(
            width: double.infinity,
            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: ShapeDecoration(
              color: AppColors.cFFFFFF ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Notifications',
                      style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                    ),
                    UIHelper.verticalSpace(4.h),
                    Text(
                      'Receive app updates and alerts',
                      style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans.copyWith(
                        fontWeight: FontWeight.w400
                      )
                    )
                  ],
                ),

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
                              return AppColors.orangeColor;
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
          ),
              UIHelper.verticalSpace(30.h),


              Container(
                width: double.infinity,
                padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: ShapeDecoration(
                  color: AppColors.cFFFFFF ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 16,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Reminder settings',
                            style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                        ),
                        UIHelper.verticalSpace(4.h),
                        Text(
                            'Want a gentle reminder to capture the\nday s moments? Set a time that suits\nyour vibe and we’ll do the rest.',
                            style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans.copyWith(
                                fontWeight: FontWeight.w400
                            )
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){NavigationService.navigateTo(Routes.journalReminderScreen);},
                        child: SvgPicture.asset(AppIcons.remenderridesideicon,height: 24.h))
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
