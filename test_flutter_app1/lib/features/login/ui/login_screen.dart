import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_app1/core/helpers/spacing.dart';
import 'package:test_flutter_app1/core/them/colors.dart';
import 'package:test_flutter_app1/core/them/styles.dart';
import 'package:test_flutter_app1/core/widgets/app_text_button.dart';
import 'package:test_flutter_app1/core/widgets/app_text_form_filed.dart';
import 'package:test_flutter_app1/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:test_flutter_app1/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureTextState = true;
  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // final bool isFromOnboarding = args?['isFromOnboarding'] ?? false;
    // final int id = args?['id'] ?? 0;
    // final String name = args?['name'] ?? '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 verticalSpace(20),
                Text("Welcome Back", style: AppTextStyles.font24BLueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: AppTextStyles.font13GrayRegular.copyWith(height: 1.6),
                ),
                verticalSpace(40),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: "Email"),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: "Password",
                        isObscureText: isObscureTextState,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureTextState = !isObscureTextState;
                            });
                          },
                          child: Icon(
                            isObscureTextState
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: isObscureTextState
                                ? ColorsManager.gray
                                : ColorsManager.mainBlue,
                          ),
                        ),
                      ),
                      verticalSpace(8),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text(
                              "Forget Password ?",
                             textAlign: TextAlign.end,
                              style: AppTextStyles.font14BLueReguler,
                            ),
                       ],
                     ),
                      verticalSpace(20),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: AppTextStyles.font16WhiteRegular,
                        onPressed: () {},
                      ),
                         verticalSpace(20),
                      DontHaveAccountText(),
                         verticalSpace(50),
                      TermsAndConditionsText()
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
