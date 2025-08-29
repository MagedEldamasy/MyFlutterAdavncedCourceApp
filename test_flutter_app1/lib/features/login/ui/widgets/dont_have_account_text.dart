import 'package:flutter/material.dart';
import 'package:test_flutter_app1/core/them/styles.dart';



class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: AppTextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: AppTextStyles.font13BlueSemiBold,
            // recognizer: TapGestureRecognizer()
            //   ..onTap = () {
            //     context.pushReplacementNamed(Routes.signUpScreen);
            //   },
          ),
        ],
      ),
    );
  }
}