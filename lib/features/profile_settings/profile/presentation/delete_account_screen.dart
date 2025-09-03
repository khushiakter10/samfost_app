import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../assets_helper/app_colors.dart';
import '../../../../assets_helper/app_fonts.dart';
import '../../../../common_widgets/custom_text_formfield.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final deleteInputController = TextEditingController();

  @override
  void dispose() {
    deleteInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: AppBar(
        backgroundColor: AppColors.cFFFFFF,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.c425466.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColors.c243B52),
          ),
        ),
        title: Text(
          "Delete account",
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            fontSize: 20.sp,
            color: AppColors.c2F2F2F,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: AppIcons.warningDangerIcon,
              ),
              UIHelper.verticalSpace(18.h),
              Text(
                "Delete your account",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.c2F2F2F,
                  fontWeight: FontWeight.w700,
                ),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                "This action cannot be undone. This will permanently delete your account and remove all your data from our servers.",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.c2F2F2F,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(24.h),
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.cF5F6F7,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: AppColors.orangeColor, size: 18.r,),
                        UIHelper.horizontalSpace(14.w),
                        Expanded(
                          child: Text('To confirm, please type "DELETE" in the field below', style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.c454545,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(12.h),
                    CustomTextfield(
                      controller: deleteInputController,
                      hintText: 'Type DELETE',
                      fillColor: AppColors.cFFFFFF,
                      borderColor: AppColors.cD1D1D1,
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(24.h),
              CustomElevatedButton(
                backgroundColor: AppColors.cFF4842,
                text: "Delete Account",
                onPressed: (){},
              ),
              UIHelper.verticalSpace(18.h),
              CustomElevatedButton(
                backgroundColor: AppColors.cFFFFFF,
                text: "Cancel",
                borderSide: BorderSide(color: AppColors.c8C8C8C),
                textStyle: TextFontStyle.textStyle14w500cFFFFFF.copyWith(
                  color: AppColors.c111111,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: (){},
              ),
              UIHelper.verticalSpace(24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: AppIcons.gaurdIcon,
                  ),
                  UIHelper.horizontalSpace(14.w),
                  Expanded(child: Text('By deleting your account, you will lose access to all your data, saved preferences, and connected services. This action is permanent and cannot be reversed.', style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.c454545,
                    fontWeight: FontWeight.w400,
                  ),))
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
