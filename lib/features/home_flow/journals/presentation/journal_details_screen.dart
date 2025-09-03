import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/features/home_flow/journals/presentation/widgets/journal_stats_widget.dart';
import 'package:samfost_app/features/home_flow/journals/presentation/widgets/photo_gallery_widget.dart';
import 'package:samfost_app/features/home_flow/journals/presentation/widgets/trip_overview_widget.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


import '../../common/widgets/journal_item_widget_content.dart';
import 'widgets/journal_entries_widget.dart';

class JournalDetailsScreen extends StatefulWidget {
  const JournalDetailsScreen({super.key});

  @override
  State<JournalDetailsScreen> createState() => _JournalDetailsScreenState();
}

class _JournalDetailsScreenState extends State<JournalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFF5F2,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: null,
            floating: true,
            snap: true,
            leading: GestureDetector(
              onTap: (){
                NavigationService.goBack;
              },
                child: Icon(Icons.arrow_back, color: AppColors.cFFFFFF)),
            actions: [Icon(Icons.more_vert, color: AppColors.cFFFFFF)],
            expandedHeight: 200.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/journeys_bg_img.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: 200.h,
                  padding: EdgeInsets.only(top: 80.h, left: 18.w, right: 18.w),
                  decoration: BoxDecoration(
                    color: AppColors.c000000.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: JournalItemWidgetContent(),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              UIHelper.verticalSpace(18.h),
              TripOverviewWidget(),
              UIHelper.verticalSpace(18.h),
              JournalEntriesWidget(),
              UIHelper.verticalSpace(18.h),
              PhotoGalleryWidget(),
              UIHelper.verticalSpace(18.h),
             JournalStatsWidget(),
              UIHelper.verticalSpace(18.h),
            ]),
          ),
        ],
      ),
    );
  }
}
