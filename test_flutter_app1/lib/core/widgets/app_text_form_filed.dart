import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_app1/core/them/colors.dart';
import 'package:test_flutter_app1/core/them/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsManager.mainBlue,
      decoration: InputDecoration(
        //to reomve all  defalt padding
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lightGray,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle: hintStyle ?? AppTextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor?? ColorsManager.moreLighterGray,
        filled: true
        
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14BlackRegular,
      
    );
  }
}
