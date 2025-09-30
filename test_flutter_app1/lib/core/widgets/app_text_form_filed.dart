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
  final Widget? perfixIcon;
  final Color? backgroundColor;
  final Function(String?) validator;
  final TextEditingController? controller;
final TextInputType? keyboardType;
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
    this.perfixIcon,
    this.backgroundColor,
    required this.validator,
    this.controller,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorsManager.mainBlue,
      keyboardType: keyboardType,
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.2),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: hintStyle ?? AppTextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: perfixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        fillColor: backgroundColor ?? ColorsManager.moreLighterGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14BlackRegular,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
