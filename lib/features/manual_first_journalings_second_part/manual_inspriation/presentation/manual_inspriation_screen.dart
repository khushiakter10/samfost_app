
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/features/create_journal_flow/inspriation/widget/custom_inspriation.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class ManualInspriationScreen extends StatefulWidget {
  final int step;
  const ManualInspriationScreen({super.key, this.step = 5});

  @override
  State<ManualInspriationScreen> createState() => _ManualInspriationScreenState();
}

class _ManualInspriationScreenState extends State<ManualInspriationScreen> {

  double get progress {
    return (widget.step + 0.4) / 9.0;
  }


  int selectedIndex = -1;

  final TextEditingController comingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    comingController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///============================= button ==========================//

                CustomArroBackbutton(
                  onTap: () {
                    NavigationService.goBack;
                  },
                  title: '',
                ),

                ///=============================== progress ===========================//
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



                Text(
                    "Why here? What pulled you in?",
                    style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                        fontSize: 20.sp
                    )
                ),

                ///================================= Text formfield ===========================//
                UIHelper.verticalSpace(8.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: CustomTextfield(
                          style: TextStyle(fontSize: 18),
                          controller: comingController,
                          maxline: 5,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
                          fillColor: AppColors.cF8F8F8,
                          hintText: 'Travelling with friends, family, a loved one or kicking it solo?',
                          hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                            fontSize: 14.sp,
                            fontStyle: FontStyle.italic,
                          ),
                          borderColor: Colors.transparent,
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        left: 3,
                        right: 3,
                        child: SizedBox(
                          height: 1,
                          child: DottedBorder(
                            dashPattern: [4, 7],
                            color: AppColors.cD1D1D1,
                            strokeWidth: 1.w,
                            padding: EdgeInsets.zero,
                            borderType: BorderType.RRect,
                            radius: Radius.zero,
                            customPath: (size) {
                              return Path()
                                ..moveTo(0, 0)
                                ..lineTo(size.width, 0);
                            },
                            child: const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(24.h),


                ///============================= text ============================//
                Text(
                    'Quick suggestions:',
                    style: TextFontStyle.textStyle16w500c000000PlusJakartaSans
                ),
                UIHelper.verticalSpace(12.h),


                ///================================ Childhood =========================//
                Row(
                  children: [
                    CustomInspriation(
                      title: 'Childhood dream',
                      isSelected: selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    UIHelper.horizontalSpace(12.h),
                    CustomInspriation(
                      title: 'Instagram post',
                      isSelected: selectedIndex == 3,
                      onTap: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                ///================================ text =========================//
                Row(
                  children: [
                    CustomInspriation(
                      title: 'Saw it on Tikok/Instagram',
                      isSelected: selectedIndex == 4,
                      onTap: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      },
                    ),
                    UIHelper.horizontalSpace(12.h),
                    CustomInspriation(
                      title: 'Bucket List',
                      isSelected: selectedIndex == 5,
                      onTap: () {
                        setState(() {
                          selectedIndex = 5;
                        });
                      },
                    ),
                  ],
                ),




                ///================================= button ==============================//


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:   Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Next',
          onPressed: () {
            NavigationService.navigateTo(Routes.manualExperenceScreen);
          },
        ),
      ),
    );
  }
}