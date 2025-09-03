//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../assets_helper/app_colors.dart';
// import '../assets_helper/app_fonts.dart';
//
// class CustomTextfield extends StatefulWidget {
//   final TextInputType? keyboardType;
//   final String? hintText;
//   final String? labelText;
//   final TextEditingController? controller;
//   final TextInputType? inputType;
//   final double? fieldHeight;
//   final int? maxline;
//   final String? Function(String?)? validator;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final bool? isObsecure;
//   final bool? isPass;
//   final FocusNode? focusNode;
//   final TextInputAction? textInputAction;
//   final Function(String)? onFieldSubmitted;
//   final Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextStyle? labelStyle;
//   final TextStyle? style;
//   final bool? isEnabled;
//   final double? cursorHeight;
//   final Color? disableColor;
//   final bool? isRead;
//   final double? borderRadius;
//   final Color? fillColor;
//   final TextStyle? hintTextSyle;
//   final Color? borderColor;
//   final TextAlign? textAlign;
//   final VoidCallback? ontap;
//   final EdgeInsetsGeometry? contentPadding;
//
//   const CustomTextfield({
//     super.key,
//     this.hintText,
//     this.labelText,
//     this.controller,
//     this.inputType,
//     this.fieldHeight,
//     this.maxline,
//     this.validator,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.isObsecure = false,
//     this.isPass = false,
//     this.focusNode,
//     this.textInputAction = TextInputAction.next,
//     this.onFieldSubmitted,
//     this.onChanged,
//     this.inputFormatters,
//     this.labelStyle,
//     this.isEnabled,
//     this.style,
//     this.cursorHeight,
//     this.disableColor,
//     this.isRead = false,
//     this.borderRadius,
//     this.fillColor,
//     this.hintTextSyle,
//     this.borderColor,
//     this.textAlign = TextAlign.left,
//     //this.textAlignVertical = TextAlignVertical.center,
//     this.ontap,
//     this.contentPadding, this.keyboardType,
//   });
//
//   @override
//   State<CustomTextfield> createState() => _CustomTextfieldState();
// }
//
// class _CustomTextfieldState extends State<CustomTextfield> {
//   late bool _obscureText;
//
//   @override
//   void initState() {
//     _obscureText = widget.isObsecure ?? false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//       //textAlignVertical: widget.textAlignVertical,
//       textAlign: widget.textAlign!,
//       readOnly: widget.isRead ?? false,
//       cursorHeight: widget.cursorHeight ?? 20,
//       focusNode: widget.focusNode,
//       obscureText: _obscureText,
//       onTap: widget.ontap,
//       textInputAction: widget.textInputAction,
//       validator: widget.validator,
//       maxLines: widget.maxline ?? 1,
//       controller: widget.controller,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       onChanged: widget.onChanged,
//       inputFormatters: widget.inputFormatters,
//       enabled: widget.isEnabled,
//       obscuringCharacter: "*",
//       keyboardType: widget.inputType,
//       style: widget.style ??
//           TextFontStyle.textStyle14w500c242424.copyWith(
//             color: AppColors.c333333,
//           ),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: widget.fillColor ?? AppColors.cFFFFFF,
//         contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
//         hintText: widget.hintText,
//         hintStyle: widget.hintTextSyle ??
//             TextFontStyle.textStyle14w500c242424.copyWith(
//               color: AppColors.c757575,
//               fontWeight: FontWeight.w400,
//             ),
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: widget.isPass == true
//             ? IconButton(
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//           icon: Icon(
//             _obscureText ? Icons.visibility_off : Icons.visibility,
//             color: AppColors.cACB5BB,
//           ),
//         )
//             : widget.suffixIcon,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
//           borderSide: BorderSide(
//             color: widget.borderColor ?? AppColors.cD1D1D1,
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
//           borderSide: BorderSide(
//             color: widget.borderColor ?? AppColors.cD1D1D1,
//             width: 1.2,
//           ),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
//           borderSide: BorderSide(
//             color: widget.borderColor ?? AppColors.cD1D1D1,
//             width: 1,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
//           borderSide: const BorderSide(
//             color:  AppColors.cD1D1D1,
//             width: 1,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
//           borderSide: const BorderSide(
//             color:  AppColors.cD1D1D1,
//             width: 1.2,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../assets_helper/app_colors.dart';
import '../assets_helper/app_fonts.dart';

class CustomTextfield extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType; // fixed here
  final double? fieldHeight;
  final int? maxline;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObsecure;
  final bool? isPass;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final bool? isRead;
  final double? borderRadius;
  final Color? fillColor;
  final TextStyle? hintTextSyle;
  final Color? borderColor;
  final TextAlign? textAlign;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextfield({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.disableColor,
    this.isRead = false,
    this.borderRadius,
    this.fillColor,
    this.hintTextSyle,
    this.borderColor,
    this.textAlign = TextAlign.left,
    this.ontap,
    this.contentPadding,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isObsecure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign!,
      readOnly: widget.isRead ?? false,
      cursorHeight: widget.cursorHeight ?? 20,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      onTap: widget.ontap,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      maxLines: widget.maxline ?? 1,
      controller: widget.controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      enabled: widget.isEnabled,
      obscuringCharacter: "*",
      keyboardType: widget.keyboardType ?? TextInputType.text, // fixed here
      style: widget.style ??
          TextFontStyle.textStyle14w500c242424.copyWith(
            color: AppColors.c333333,
          ),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor ?? AppColors.cFFFFFF,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        hintText: widget.hintText,
        hintStyle: widget.hintTextSyle ??
            TextFontStyle.textStyle14w500c242424.copyWith(
              color: AppColors.c757575,
              fontWeight: FontWeight.w400,
            ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPass == true
            ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            size: 16,
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.cACB5BB,
          ),
        )
            : widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.cD1D1D1,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.cD1D1D1,
            width: 1.2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.cD1D1D1,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          borderSide: const BorderSide(
            color: AppColors.cD1D1D1,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
          borderSide: const BorderSide(
            color: AppColors.cD1D1D1,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
