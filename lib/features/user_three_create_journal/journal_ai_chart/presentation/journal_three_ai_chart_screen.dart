import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:samfost_app/common_widgets/custom_text_formfield.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../assets_helper/app_image.dart';
import '../../../home_flow/common/widgets/gradient_background.dart';



class JournalThreeAiChartScreen extends StatefulWidget {
  const JournalThreeAiChartScreen({super.key});

  @override
  State<JournalThreeAiChartScreen> createState() => _JournalThreeAiChartScreenState();
}

class _JournalThreeAiChartScreenState extends State<JournalThreeAiChartScreen> {
  final BehaviorSubject<double> _insetSubject = BehaviorSubject.seeded(0);
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _insetSubject.close();
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 100),
          child: _buildAppBar(),
        ),
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(child: ListView(
              reverse: true,
              padding: EdgeInsets.only(top: 18.h, bottom: 12.h),
              children: [
                // First bubble
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 60, bottom: 12),
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Sounds relaxing! What was the highlight of your trip?",
                    style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                // Second bubble
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 60, bottom: 12),
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.cFDF5E6,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Walking through Montmartre at sunset.",
                    style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            )),
            _buildInputWidget(),
          ],
        ),
        // bottomNavigationBar: SafeArea(child: ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 10.w,
        right: 16.w,
        bottom: 16.w,
      ),
      decoration: BoxDecoration(

        color: AppColors.cFDF5E6,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.c000000.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(AppImages.chatAppBarBg),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.c425466.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    NavigationService.goBack;
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.c243B52),
                ),
              ),
              UIHelper.horizontalSpace(12.w),
              Text(
                "✍️  Today’s memories",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.c111111,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              CustomImageView(imagePath: AppIcons.planeIcon),
              UIHelper.horizontalSpace(12.w),
              Text(
                "Summer in Japan 2025",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.c181818,
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(8.h),
          Row(
            children: [
              CustomImageView(imagePath: AppIcons.calendarIcon),
              UIHelper.horizontalSpace(12.w),
              Text(
                "August 2-10,2025 Tokyo, Japan",
                style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.c181818,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputWidget() {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 18.h, left: 16.w, right: 16.w),
      // padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(

        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: CustomImageView(imagePath: AppIcons.addImageBtnIcon),
          ),
          IconButton(
            onPressed: () {},
            icon: CustomImageView(imagePath: AppIcons.addRecordBtnIcon),
          ),

          Expanded(
            child: CustomTextfield(
              controller: _inputController,
              maxline: 2,
              hintText: "Alright storyteller - what happened today?",
              borderColor: Colors.transparent,
            ),
          ),

          IconButton(
            onPressed: () {
              NavigationService.navigateTo(Routes.firstMemorySavedScreen);
            },
            icon: CustomImageView(imagePath: AppIcons.sendMsgBtnIcon),
          ),
        ],
      ),
    );
  }
}
