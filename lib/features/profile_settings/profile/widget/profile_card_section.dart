
import 'package:change_app_package_name/file_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/assets_helper/app_icons.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class ProfileCardSection extends StatelessWidget {
  const ProfileCardSection({
    super.key,

    required this.text,
    required this.callback, required this.icon,
  });
  final Widget icon;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric( vertical: 8.h),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 42.w,
                height: 42.h,
                decoration: ShapeDecoration(
                 color:  Color(0x19FF6F3C),
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x28919EAB),
                      blurRadius: 32,
                      offset: Offset(0, 16),
                      spreadRadius: -4,
                    )
                  ],
                ),
                child: Center(
                  child: icon,
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              Text(
                text,
                style: TextFontStyle.textStyle20w600c1C1D20PlusJakartaSans
                    .copyWith(fontWeight: FontWeight.w500,fontSize: 18.sp),
              ),
            ],
          ),
          SvgPicture.asset(AppIcons.arrowLeftIcon,height: 24,)
        ],
      ),
    );
  }
}