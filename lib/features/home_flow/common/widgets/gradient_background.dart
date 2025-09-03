import 'package:flutter/material.dart';
import 'package:samfost_app/assets_helper/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cE07B39, AppColors.cFAF3E0],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: child,
    );
  }
}
