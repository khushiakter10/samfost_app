import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class ManualSetupConditionScreen extends StatefulWidget {
  const ManualSetupConditionScreen({super.key});

  @override
  State<ManualSetupConditionScreen> createState() => _ManualSetupConditionScreenState();
}

class _ManualSetupConditionScreenState extends State<ManualSetupConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.journybacroundimage),fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.h,vertical: 14.h),
            child: Column(
              children: [
                UIHelper.verticalSpace(50.h),
                Image.asset(AppImages.greensignetureimage,height: 200.h),
                UIHelper.verticalSpace(34.h),
                Text(
                    'What a lovely \nsounding trip…',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                        fontSize: 24.sp,fontWeight: FontWeight.w600
                    )
                ),
                UIHelper.verticalSpace(8.h),


                Text(
                    'Your adventure’s ready to begin.',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                        fontSize: 16.sp,fontWeight: FontWeight.w500
                    )
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                    'We’ll help you capture every little\nmoment — with quick prompts that\nmake journaling feel effortless.',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle18w600c2F2F2FPlusJakartaSans.copyWith(
                        fontSize: 16.sp,fontWeight: FontWeight.w500
                    )
                ),
                UIHelper.verticalSpace(200.h),
                CustomElevatedButton(
                  icon: SvgPicture.asset(AppIcons.buttonicon),
                  text: "Let's start journaling",
                  onPressed: () {
                    NavigationService.navigateTo(Routes.manualFirstJournalScreen);

                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
