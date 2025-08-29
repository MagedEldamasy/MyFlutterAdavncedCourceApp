import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_app1/core/them/colors.dart';
import 'package:test_flutter_app1/core/them/font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    color: const Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font24BLueBold = TextStyle(
    fontSize: 24.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14BLueReguler = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font32BLueBold = TextStyle(
    fontSize: 32.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.gray,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.lightGray,
    fontWeight: FontWeightHelper.regular,
  );
    static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16WhiteRegular = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
  );
    static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkBlue,
  );
    static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainBlue,
  );
}
