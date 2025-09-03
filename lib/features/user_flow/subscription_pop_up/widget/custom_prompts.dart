import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';
import '../../../../assets_helper/app_fonts.dart';

class CustomPrompts extends StatelessWidget {
  final  Widget icon;
  final String title;

  const CustomPrompts({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        UIHelper.horizontalSpace(8.w),
        Column(
          children: [
            Text(
              title,
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                color:  Color(0xFF111111) ,
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          ],
        )

      ],
    );
  }
}