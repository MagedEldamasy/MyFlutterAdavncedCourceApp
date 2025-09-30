import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_app1/core/helpers/spacing.dart';
import 'package:test_flutter_app1/core/them/styles.dart';
import 'package:test_flutter_app1/core/widgets/app_text_button.dart';
import 'package:test_flutter_app1/features/sing_up/logic/sign_up_cubit.dart';
import 'package:test_flutter_app1/features/sing_up/ui/widgets/have_account_text.dart';
import 'package:test_flutter_app1/features/sing_up/ui/widgets/sign_up_block_listener.dart';
import 'package:test_flutter_app1/features/sing_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // verticalSpace(20.h),
                Text("Create Account",style:AppTextStyles.font24BLueBold),
                verticalSpace(10.h),
                Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in."
                ,style:AppTextStyles.font14LightGrayRegular),
                verticalSpace(20.h),
                SignUpForm(),
                verticalSpace(20.h),
                AppTextButton(
                      buttonText: "Sign Up",
                      textStyle: AppTextStyles.font16WhiteRegular,
                      onPressed: () {
                        validateAndSubmitForm(context);
                      },
                    ),
                    verticalSpace(20),
                    Center(child: HaveAccountText()),
                     SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void validateAndSubmitForm(BuildContext context) {
if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().sigunUp();
    }
  }
}