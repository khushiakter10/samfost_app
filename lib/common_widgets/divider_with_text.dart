import 'package:flutter/material.dart';

import '../assets_helper/app_colors.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.cD1D1D1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.cD1D1D1,
          ),
        ),
      ],
    );
  }
}
