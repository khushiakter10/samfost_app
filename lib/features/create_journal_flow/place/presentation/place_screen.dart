import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/assets_helper/app_image.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/common_widgets/custom_elevated_button.dart';
import 'package:samfost_app/features/create_journal_flow/place/widget/quick_suggestions.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../../../common_widgets/custom_tag_input.dart';



class PlaceScreen extends StatefulWidget {
  final int step;
  const PlaceScreen({super.key, this.step = 1});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final _countryTagController = StringTagController();
  final _cityTagController = StringTagController();
  late double _distanceToField;

  String? selectedCountry;


  final List<String> countries = [
    "Bangladesh",
    "India",
    "United States",
    "United Kingdom",
    "Canada",
    "Australia",
  ];


  final List<String> cities = ["Dhaka", "Chittagong", "Khulna", "Delhi",
    "Mumbai", "Bangalore", "New York", "Los Angeles", "Chicago",
    "London", "Manchester", "Birmingham", "Toronto", "Vancouver", "Montreal",
    "Sydney", "Melbourne", "Brisbane"
  ];

  //=======================//

  double get progress {
    return (widget.step + 1) / 9.0;
  }
  int selectedIndex = -1;

  bool isCountryErrVisible = false;
  bool isCityErrVisible = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    _countryTagController.dispose();
    _cityTagController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

    ///=========================== Button ===========================//
              CustomArroBackbutton(
                onTap: () {
                  NavigationService.goBack;
                },
                title: '',
              ),

    ///====================================== mProgress =======================//
              UIHelper.verticalSpace(24.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20.r),
                  value: progress,
                  minHeight: 10,
                  backgroundColor: AppColors.cF3F3F3,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.orangeColor,
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),

              Text(
                'Where in the world are you off to?',
                style: TextFontStyle.textStyle12w600c0A2540PlusJakartaSans
                    .copyWith(fontSize: 20.sp),
              ),
              UIHelper.verticalSpace(12.h),

    ///========================================== Country ==============================//
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: CountryTagField(
                            suggestions: countries,
                            controller: _countryTagController,
                            hintText: "Country name",
                            suffixIconAsset: AppIcons.countrylocation,
                            distanceToField: _distanceToField,
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
                    Visibility(
                      visible: isCountryErrVisible,
                      child: Text("Country name is required", style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cFF4842,
                      ),),
                    ),
                  ],
                ),
              ),

     ///======================================== City textfield  =====================================//

              UIHelper.verticalSpace(12.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: CountryTagField(
                            suggestions: cities,
                            controller: _cityTagController,
                            hintText: "City name",
                            suffixIconAsset: AppImages.imagecity,
                            distanceToField: _distanceToField,
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
                    Visibility(
                      visible: isCityErrVisible,
                      child: Text("City name is required", style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cFF4842,
                      ),),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
              Center(
                child: Text(
                  '(You can edit this later)',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle14w400c757575PlusJakartaSans,
                ),
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                'Quick suggestions:',
                style: TextFontStyle.textStyle16w500c000000PlusJakartaSans,
              ),

        ///================================================== Thailand ================================//
              UIHelper.verticalSpace(12.h),

              Row(
                children: [
                  Expanded(
                    child: QuickSuggestions(
                      title: 'Thailand',
                      isSelected: selectedIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                  ),
                  UIHelper.horizontalSpace(12.h),
                  Expanded(
                    child: QuickSuggestions(
                      title: 'South America',
                      isSelected: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),

              ///================================================== Mexico ================================//
              Row(
                children: [
                  Expanded(
                    child: QuickSuggestions(
                      title: 'Mexico',
                      isSelected: selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                  ),
                  UIHelper.horizontalSpace(12.h),
                  Expanded(
                    child: QuickSuggestions(
                      title: 'Singapore',
                      isSelected: selectedIndex == 3,
                      onTap: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),

              ///================================================== Italy ================================//
              Row(
                children: [
                  Expanded(
                    child: QuickSuggestions(
                      title: 'Italy',
                      isSelected: selectedIndex == 4,
                      onTap: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      },
                    ),
                  ),
                  UIHelper.horizontalSpace(12.h),
                  Expanded(
                    child: QuickSuggestions(
                      title: 'Malaysia',
                      isSelected: selectedIndex == 5,
                      onTap: () {
                        setState(() {
                          selectedIndex = 5;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
///================================ button ===============================//
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
        child: CustomElevatedButton(
          icon: SvgPicture.asset(AppIcons.buttonicon),
          text: 'Next',
          onPressed: () {
            if ((_countryTagController.getTags ?? []).isEmpty) {
              setState(() {
                isCountryErrVisible = true;
              });
            } else {
              setState(() {
                isCountryErrVisible = false;
              });
            }
            if ((_cityTagController.getTags ?? []).isEmpty) {
              setState(() {
                isCityErrVisible = true;
              });
            } else {
              setState(() {
                isCityErrVisible = false;
              });
            }
            if (isCountryErrVisible || isCityErrVisible) {
              return;
            }
            NavigationService.navigateTo(Routes.placeOptionScreen);
          },
        ),
      ),
    );
  }
}
