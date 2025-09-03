import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';
import 'package:samfost_app/assets_helper/app_fonts.dart';
import 'package:samfost_app/helpers/ui_helpers.dart';

class ClickTooltip extends StatefulWidget {
  final Widget child;
  final String title;
  final String message;

  const ClickTooltip({super.key, required this.child, required this.title, required this.message});

  @override
  State<ClickTooltip> createState() => _ClickTooltipState();
}

class _ClickTooltipState extends State<ClickTooltip> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _widgetKey = GlobalKey();
  double toolTipWidth = 237.w;

  void _showTooltip() {
    final renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
    if (overlay == null) return;

    final screenSize = MediaQuery.of(context).size;
    final offset = renderBox.localToGlobal(Offset.zero, ancestor: overlay);
    final widgetSize = renderBox.size;

    const double triangleHeight = 8.0;
    final double tooltipWidth = toolTipWidth;
    final double tooltipHeightEstimate = 60.h + triangleHeight;

    double tooltipLeft = offset.dx + (widgetSize.width / 2) - (tooltipWidth / 2);
    double tooltipTop = offset.dy - tooltipHeightEstimate - triangleHeight;

    const double screenPadding = 8.0;

    if (tooltipLeft < screenPadding) {
      tooltipLeft = screenPadding;
    } else if (tooltipLeft + tooltipWidth > screenSize.width - screenPadding) {
      tooltipLeft = screenSize.width - tooltipWidth - screenPadding;
    }

    if (tooltipTop < screenPadding) {
      tooltipTop = screenPadding;
    }

    // ✅ Compute arrowOffset relative to widget.child
    double desiredArrowCenterXInTooltip = (offset.dx + widgetSize.width / 2) - tooltipLeft;
    double arrowOffset = desiredArrowCenterXInTooltip - (tooltipWidth / 2);

    const double arrowMaxEdgeOffset = 12.0;
    arrowOffset = arrowOffset.clamp(
      -(tooltipWidth / 2) + _TooltipShapeBorder().arrowWidth / 2 + arrowMaxEdgeOffset,
      (tooltipWidth / 2) - _TooltipShapeBorder().arrowWidth / 2 - arrowMaxEdgeOffset,
    );

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: tooltipLeft,
        top: tooltipTop,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: tooltipWidth,
            padding: const EdgeInsets.only(bottom: triangleHeight),
            decoration: ShapeDecoration(
              color: AppColors.cFFFFFF,
              shape: _TooltipShapeBorder(
                arrowOffset: arrowOffset, // ✅ pass computed arrow offset
              ),
              shadows: [
                BoxShadow(
                  color: AppColors.c000000.withValues(alpha: 0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: AppColors.orangeColor),
                  UIHelper.horizontalSpace(4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c757575,
                          ),
                        ),
                        Text(
                          widget.message,
                          style: TextFontStyle.textStylePlusJakartaSans.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c454545,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 2), _hideTooltip);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _widgetKey,
      onTap: _showTooltip,
      child: widget.child,
    );
  }
}

class _TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowOffset;
  final Radius radius;

  const _TooltipShapeBorder({
    this.arrowWidth = 16.0,
    this.arrowHeight = 8.0,
    this.arrowOffset = 0.0,
    this.radius = const Radius.circular(8.0),
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTRB(rect.left, rect.top, rect.right, rect.bottom - arrowHeight),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTRB(rect.left, rect.top, rect.right, rect.bottom - arrowHeight),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ));

    double arrowXCenter = rect.center.dx + arrowOffset;

    path.moveTo(arrowXCenter - arrowWidth / 2, rect.bottom - arrowHeight);
    path.lineTo(arrowXCenter, rect.bottom);
    path.lineTo(arrowXCenter + arrowWidth / 2, rect.bottom - arrowHeight);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
