import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_app1/core/helpers/extensions.dart';
import 'package:test_flutter_app1/core/routing/routes.dart';
import 'package:test_flutter_app1/core/them/styles.dart';
import 'package:test_flutter_app1/core/widgets/app_text_button.dart';
import 'package:test_flutter_app1/features/onBording/ui/widgets/doctor_image_and_text.dart';
import 'package:test_flutter_app1/features/onBording/ui/widgets/onbording_tool_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                OnborardingToolBar(),
                SizedBox(height: 30.h),
                DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font13GrayRegular,
                      ),
                      SizedBox(height: 30.h),
                      AppTextButton(
                        buttonText: "Get Started",
                        textStyle: AppTextStyles.font16WhiteRegular,
                        onPressed: () {
                          var map = <String, dynamic>{};
                          map["isFromOnboarding"] = true;
                          map["id"] = 1;
                          map["name"] = "test";
                          context.pushNamed(Routes.loginScreen, arguments: map);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
