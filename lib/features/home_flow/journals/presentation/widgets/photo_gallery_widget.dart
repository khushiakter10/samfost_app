import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/common_widgets/custom_card.dart';
import 'package:samfost_app/common_widgets/custom_card_title.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';


class PhotoGalleryWidget extends StatelessWidget {
  PhotoGalleryWidget({super.key});


  final imageUrls = [
    'assets/images/gallery_photo_1.png',
    'assets/images/gallery_photo_2.png',
    'assets/images/gallery_photo_3.png',
    'assets/images/gallery_photo_4.png',
    'assets/images/gallery_photo_5.png',
    'assets/images/gallery_photo_6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(children: [_buildHeader(), _buildPhotoGrid()]),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCardTitle(title: "Photos gallery"),

        Row(
          children: [
            Text(
              "24 photos",
              style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                fontSize: 14.sp,
                color: AppColors.c5E5E5E,
              ),
            ),
            Icon(Icons.arrow_right_alt_outlined, color: AppColors.c5E5E5E),
          ],
        ),
      ],
    );
  }


  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CustomImageView(
            imagePath: imageUrls[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
