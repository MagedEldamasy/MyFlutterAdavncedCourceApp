import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_flutter_app1/core/them/styles.dart';

class OnborardingToolBar extends StatelessWidget {
  const OnborardingToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo.svg'),
        SizedBox(width: 10.w),
        Text("DocDoc", style: TextStyles.font24BlackBold),
      ],
    );
  }
}
