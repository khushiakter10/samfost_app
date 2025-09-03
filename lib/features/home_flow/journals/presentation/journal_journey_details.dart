import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import '../../../../assets_helper/app_colors.dart';
import '../../../../assets_helper/app_fonts.dart';
import '../../../../assets_helper/app_icons.dart';
import '../../../../assets_helper/app_image.dart';
import '../../../../common_widgets/custom_image_view.dart';
import '../../../../common_widgets/custom_text_formfield.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../create_journal_flow/place_option/widget/blank_calander.dart';

class JournalJourneyDetails extends StatefulWidget {
  const JournalJourneyDetails({super.key});

  @override
  State<JournalJourneyDetails> createState() => _JournalJourneyDetailsState();
}

class _JournalJourneyDetailsState extends State<JournalJourneyDetails> {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final List<String> countries = [
    "Bangladesh",
    "India",
    "United States",
    "United Kingdom",
    "Canada",
    "Australia",
  ];


  final Map<String, List<String>> countryCities = {
    "Bangladesh": ["Dhaka", "Chittagong", "Khulna"],
    "India": ["Delhi", "Mumbai", "Bangalore"],
    "United States": ["New York", "Los Angeles", "Chicago"],
    "United Kingdom": ["London", "Manchester", "Birmingham"],
    "Canada": ["Toronto", "Vancouver", "Montreal"],
    "Australia": ["Sydney", "Melbourne", "Brisbane"],
  };

  String? selectedCountry;

  @override
  void dispose() {
    countryController.dispose();
    cityController.dispose();

    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.cFFFFFF,
        surfaceTintColor: AppColors.cFFFFFF,
        elevation: 4, // Shadow depth
        shadowColor: Colors.black.withValues(alpha: 0.4),
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
          "Journey Details",
          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
            fontSize: 20.sp,
            color: AppColors.c111111,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNameTripInput(),
              UIHelper.verticalSpace(24.h),
              _buildCountryInput(),
              UIHelper.verticalSpace(24.h),
              _buildCityInput(),
              UIHelper.verticalSpace(24.h),
              _buildStartDateInput(),
              UIHelper.verticalSpace(24.h),
              _buildEndDateInput(),
              UIHelper.verticalSpace(24.h),
              _buildWhosComingInput(),
              UIHelper.verticalSpace(24.h),
              _buildWhyHereInput(),
              UIHelper.verticalSpace(24.h),
              _buildAboutTripInput(),
              UIHelper.verticalSpace(24.h),
              _buildExcitedTripInput(),
              UIHelper.verticalSpace(24.h),
              CustomElevatedButton(
                  text: "Save",
                  icon: CustomImageView(
                    imagePath: AppIcons.buttonicon,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  _buildNameTripInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Name of the trip",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
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
                  suffixIcon: Transform.scale(
                    scale: 0.60,
                    child: CustomImageView(
                      imagePath: AppIcons.summericon,
                      height: 24.h,
                      width: 24.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColors.cF8F8F8,
                  hintText: 'Summer in Japan',
                  hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                    fontSize: 16.sp,
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
      ],
    );
  }

  _buildCountryInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Name of country",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return countries.where((String country) {
                      return country.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      );
                    });
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onFieldSubmitted) {
                    countryController.text =
                        controller.text;
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        fillColor: AppColors.cF8F8F8,
                        filled: true,
                        hintText: 'Country name',
                        hintStyle: TextFontStyle
                            .textStyle14w400c757575PlusJakartaSans
                            .copyWith(
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic,
                        ),
                        suffixIcon: Transform.scale(
                          scale: 0.60,
                          child: CustomImageView(
                            imagePath: AppIcons.countrylocation,
                            height: 24.h,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        countryController.text = value;
                      },
                    );
                  },
                  onSelected: (String selection) {
                    countryController.text = selection;
                    selectedCountry = selection;
                    setState(() {});
                  },
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
      ],
    );
  }

  _buildCityInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Name of places going",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (selectedCountry == null ||
                        textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return countryCities[selectedCountry!]!.where((
                        String city,
                        ) {
                      return city.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      );
                    });
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onFieldSubmitted) {
                    cityController.text =
                        controller.text; // Sync with controller
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        fillColor: AppColors.cF8F8F8,
                        filled: true,
                        hintText: 'City name',
                        hintStyle: TextFontStyle
                            .textStyle14w400c757575PlusJakartaSans
                            .copyWith(
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic,
                        ),
                        suffixIcon: Transform.scale(
                          scale: 0.60,
                          child: CustomImageView(
                            imagePath: AppImages.imagecity,
                            height: 24.h,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        cityController.text = value;
                      },
                    );
                  },
                  onSelected: (String selection) {
                    cityController.text = selection;
                    setState(() {});
                  },
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
      ],
    );
  }

  _buildStartDateInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Start date",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
        LogActivityCalander(
          controller: startDateController,
          hintText: 'Select start date',
        ),
      ],
    );
  }

  _buildEndDateInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "End date",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
        LogActivityCalander(
          controller: startDateController,
          hintText: 'Select start date',
        ),
      ],
    );
  }

  _buildWhosComingInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Who’s coming on the journey?",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColors.cF8F8F8,
                  hintText: 'My friends & cousin',
                  hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                    fontSize: 16.sp,
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
      ],
    );
  }

  _buildWhyHereInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Why here? What pulled you in?",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColors.cF8F8F8,
                  hintText: 'Childhood dream',
                  hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                    fontSize: 16.sp,
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
      ],
    );
  }

  _buildAboutTripInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "What’s this trip about?",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColors.cF8F8F8,
                  hintText: 'A break from real life',
                  hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                    fontSize: 16.sp,
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
      ],
    );
  }

  _buildExcitedTripInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "What are you most excited to do on this trip?",
            style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans.copyWith(
                fontSize: 16.sp
            )
        ),
        UIHelper.verticalSpace(12.h),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColors.cF8F8F8,
                  hintText: 'Me and my friend are going after a long time so we think it will increase our bonding.',
                  hintTextSyle: TextFontStyle.textStyle14w400c757575PlusJakartaSans.copyWith(
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                  ),
                  borderColor: Colors.transparent,
                  maxline: 3,
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
      ],
    );
  }
}
