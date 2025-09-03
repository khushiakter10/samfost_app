// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:dotted_border/dotted_border.dart';
//
// import 'package:samfosterbrown_app/assets_helper/app_colors.dart';
// import 'package:samfosterbrown_app/assets_helper/app_fonts.dart';
// import 'package:samfosterbrown_app/assets_helper/app_icons.dart';
// import 'package:samfosterbrown_app/common_widgets/custom_text_formfield.dart';
//
// class LogActivityCalander extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//
//   const LogActivityCalander({
//     super.key,
//     required this.controller,
//     required this.hintText,
//   });
//
//   @override
//   State<LogActivityCalander> createState() => _LogActivityCalanderState();
// }
//
// class _LogActivityCalanderState extends State<LogActivityCalander> {
//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1950),
//       lastDate: DateTime(2100),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//               primary: AppColors.cFFFFFF,
//               onPrimary: AppColors.orangeColor,
//               onSurface: AppColors.cFFFFFF,
//               background: AppColors.orangeColor,
//               surface: AppColors.orangeColor,
//             ),
//             dialogBackgroundColor: AppColors.orangeColor,
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (picked != null) {
//       final selectedDate = DateFormat('dd/MM/yyyy').format(picked);
//       setState(() {
//         widget.controller.text = selectedDate;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       decoration: BoxDecoration(
//         color: AppColors.cFFFFFF,
//         borderRadius: BorderRadius.circular(11.r),
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(bottom: 1.h),
//             child:
//
//             CustomTextfield(
//               controller: widget.controller,
//               ontap: _selectDate,
//               suffixIcon: Transform.scale(
//                 scale: 0.60,
//                 child: SvgPicture.asset(
//                   AppIcons.calandericon,
//                   height: 24.h,
//                 ),
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
//               fillColor: AppColors.cF8F8F8,
//               hintText: widget.hintText,
//               hintTextSyle: TextFontStyle
//                   .textStyle14w400c757575PlusJakartaSans
//                   .copyWith(
//                 fontSize: 16.sp,
//                 fontStyle: FontStyle.italic,
//               ),
//               borderColor: Colors.transparent,
//             ),
//           ),
//
//           Positioned(
//             bottom: 0,
//             left: 3,
//             right: 3,
//             child: SizedBox(
//               height: 1,
//               child: DottedBorder(
//                 dashPattern: [4, 7],
//                 color: AppColors.cD1D1D1,
//                 strokeWidth: 1.w,
//                 padding: EdgeInsets.zero,
//                 borderType: BorderType.RRect,
//                 radius: Radius.zero,
//                 customPath: (size) {
//                   return Path()
//                     ..moveTo(0, 0)
//                     ..lineTo(size.width, 0);
//                 },
//                 child: const SizedBox.shrink(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//   }
// }
//
// //
//
