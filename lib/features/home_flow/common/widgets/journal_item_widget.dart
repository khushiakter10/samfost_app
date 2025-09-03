import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../assets_helper/app_colors.dart';
import '../../../../assets_helper/app_fonts.dart';
import '../../../../assets_helper/app_icons.dart';
import '../../../../common_widgets/custom_image_view.dart';
import '../../../../helpers/ui_helpers.dart';
import 'journal_item_widget_content.dart';

class JournalItemWidget extends StatelessWidget {
  const JournalItemWidget({super.key, this.margin});

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage("assets/images/journeys_bg_img.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.c000000.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.all(18.r),
        child: JournalItemWidgetContent(),
      ),
    );
  }
}
