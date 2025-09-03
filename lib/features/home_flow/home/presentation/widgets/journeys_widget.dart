import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/features/home_flow/common/widgets/journal_item_widget.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';


class JourneysWidget extends StatefulWidget {
  const JourneysWidget({super.key});

  @override
  State<JourneysWidget> createState() => _JourneysWidgetState();
}

class _JourneysWidgetState extends State<JourneysWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  final _selectedIndexSubject = BehaviorSubject<int>();

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndexSubject.close();
    super.dispose();
  }

  int getCurrentPageIndex() {
    return _pageController.hasClients ? _pageController.page?.round() ?? 0 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            "Your journeys",
            style: TextFontStyle.textStylePlusJakartaSans.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.c000000,
            ),
          ),
        ),
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              _selectedIndexSubject.add(index);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return JournalItemWidget(margin: EdgeInsets.only(right: 16.w));
            },
          ),
        ),

        UIHelper.verticalSpace(16.w),

        // Indicators
        StreamBuilder(
          stream: _selectedIndexSubject,
          builder: (context, snap) {
            final currentIndex = snap.data ?? 0;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.orangeColor
                        : AppColors.cD1D1D1,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
