
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../widget/controller.dart';


class EditPersonalInformationScreen extends StatefulWidget {
  const EditPersonalInformationScreen({super.key});

  @override
  State<EditPersonalInformationScreen> createState() =>
      _EditPersonalInformationScreenState();
}

class _EditPersonalInformationScreenState
    extends State<EditPersonalInformationScreen> {
  final ProfileController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: controller.name.value);
    emailController = TextEditingController(text: controller.email.value);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your name';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your email';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'Please enter a valid email';
    return null;
  }

  void _onUpdatePressed() {
    if (_formKey.currentState!.validate()) {
      controller.updateProfile(nameController.text, emailController.text);
      Get.back(); // Return to ProfileScreen
      Get.snackbar('Success', 'Profile updated successfully');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    await controller.pickImage(source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArroBackbutton(
                  onTap: (){NavigationService.goBack;},
                    title: 'Edit Personal Info'),


                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(() {
                        return CircleAvatar(
                          radius: 50.r,
                          backgroundColor:
                          AppColors.orangeColor.withOpacity(0.2),
                          backgroundImage: controller.profileImage.value != null
                              ? FileImage(File(controller.profileImage.value!.path))
                              : null,
                        );
                      }),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                color: AppColors.cFFE2D8,
                                padding: EdgeInsets.all(20.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        _pickImage(ImageSource.camera);
                                      },
                                      child: Text(
                                        'Take Photo',
                                        style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                                      ),
                                    ),
                                    UIHelper.verticalSpace(10.h),
                                    Divider(color: Colors.grey),
                                    UIHelper.verticalSpace(10.h),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        _pickImage(ImageSource.gallery);
                                      },
                                      child: Text(
                                        'Select from library',
                                        style:
                                        TextFontStyle.textStyle16w500c000000PlusJakartaSans,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            AppImages.cameraimage,
                            height: 24.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Text(
                  'Full Name',
                  style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextfield(
                  controller: nameController,
                  prefixIcon:   Transform.scale(
                    scale: 0.50,
                      child: SvgPicture.asset(AppIcons.nameicon)),
                  hintText: 'Enter your name',
                  validator: _validateName,
                  fillColor: AppColors.cFFFFFF,
                  borderColor: AppColors.cD1D1D1,
                ),
                UIHelper.verticalSpace(24.h),

                Text(
                  'Email',
                  style: TextFontStyle.textStyle14w500c6C7278PlusJakartaSans,
                ),
                UIHelper.verticalSpace(4.h),


                CustomTextfield(
                  isRead: true,
                  controller: emailController,
                    prefixIcon:  Transform.scale(
                      scale: 0.50,
                      child: SvgPicture.asset(AppIcons.emailicon,
                         width: 18.h),
                    ),
                  hintText: 'Enter your email',
                  validator: _validateEmail,
                  fillColor: AppColors.cE8E8E8
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: CustomElevatedButton(
          text: 'Update', onPressed: () { 
            NavigationService.navigateTo(Routes.updatePasswordScreen);
        },
         // onPressed: _onUpdatePressed,
        ),
      ),
    );
  }
}
