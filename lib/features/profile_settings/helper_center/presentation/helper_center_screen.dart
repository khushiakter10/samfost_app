import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/common_widgets/custom_arrow_backbutton.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';



class HelperCenterScreen extends StatefulWidget {
  const HelperCenterScreen({super.key});

  @override
  State<HelperCenterScreen> createState() => _HelperCenterScreenState();
}

class _HelperCenterScreenState extends State<HelperCenterScreen> {

  final List<String> icon = [
    'assets/icons/contacticon.svg',
    'assets/icons/whatssappicon.svg',
    'assets/icons/instragramicon.svg',
    'assets/icons/facbook.svg',
  ];

  final List<String> title = [
    'Contact us',
    'WhatsApp',
    'Instagram',
    'Facebook',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 14.h),
          child: SafeArea(
            child: Column(
              children: [

        //=============================== Arrw Button ===================================//

                CustomArroBackbutton(
                    onTap: (){NavigationService.goBack;},
                    title: 'Help Center'),
                UIHelper.verticalSpace(30.h),
        //======================================= Listview ======================================//

                ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                        width: double.infinity,
                        padding:  EdgeInsets.all(24),
                        decoration: ShapeDecoration(
                          color: AppColors.cF5F6F7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),child:Row(
                      children: [
                        SvgPicture.asset(
                          icon[index],
                          height: 24.h,
                          color: AppColors.orangeColor,

                        ),
                        UIHelper.horizontalSpace(16.w),
                        Text(
                            title[index],
                            style: TextFontStyle.textStyle16w500c000000PlusJakartaSans.copyWith(
                                fontSize: 18.sp,fontWeight: FontWeight.w500
                            )
                        )


                      ],
                    )
                    );

                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return UIHelper.verticalSpace(16.h);
                  },
                  itemCount: icon.length,

                ),

              ],
            ),
          ),
        )


    );
  }
}
