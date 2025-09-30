import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_app1/core/helpers/app_regex.dart';
import 'package:test_flutter_app1/core/helpers/spacing.dart';
import 'package:test_flutter_app1/core/them/colors.dart';
import 'package:test_flutter_app1/core/widgets/app_text_form_filed.dart';
import 'package:test_flutter_app1/core/widgets/password_validations.dart';
import 'package:test_flutter_app1/features/sing_up/logic/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureTextState = true;
  bool isObscureTextState2 = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordCcontroller;
    setupPasswordControllerListener();
  }
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          //email
          AppTextFormField(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter your email";
              }
            },
            controller: context.read<SignUpCubit>().emailCcontroller,
          ),
          verticalSpace(18),
          //phone number
          AppTextFormField(
            hintText: "Phone Number",
            keyboardType: TextInputType.phone,
            controller: context.read<SignUpCubit>().phoneCcontroller,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return "Please enter your valid phone number";
              }
            },
            perfixIcon: SizedBox(
              width: 60, // just enough space for flag + divider
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      "assets/images/flag.png",
                      width: 30,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 24,
                    color: ColorsManager.lightGray,
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(18),
          // password
          AppTextFormField(
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<SignUpCubit>().passwordCcontroller,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return "Please enter your password";
              }
            },
            isObscureText: isObscureTextState,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureTextState = !isObscureTextState;
                });
              },
              child: Icon(
                isObscureTextState ? Icons.visibility_off : Icons.visibility,
                color: isObscureTextState
                    ? ColorsManager.gray
                    : ColorsManager.mainBlue,
              ),
            ),
          ),
          verticalSpace(18),
          // confirm password
          AppTextFormField(
            hintText: "Confirm Password",
            keyboardType: TextInputType.visiblePassword,
            controller: context.read<SignUpCubit>().confirmPasswordCcontroller,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return "Please enter your confirm password";
              } else if (value !=
                  context.read<SignUpCubit>().passwordCcontroller.text) {
                return "Password does not match";
              }
            },
            isObscureText: isObscureTextState2,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureTextState2 = !isObscureTextState2;
                });
              },
              child: Icon(
                isObscureTextState2 ? Icons.visibility_off : Icons.visibility,
                color: isObscureTextState2
                    ? ColorsManager.gray
                    : ColorsManager.mainBlue,
              ),
            ),
          ),
          verticalSpace(18),
         // password validation
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
  

}
