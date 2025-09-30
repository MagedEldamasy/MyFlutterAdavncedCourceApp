import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_app1/core/helpers/app_regex.dart';
import 'package:test_flutter_app1/core/helpers/spacing.dart';
import 'package:test_flutter_app1/core/them/colors.dart';
import 'package:test_flutter_app1/core/widgets/app_text_form_filed.dart';
import 'package:test_flutter_app1/features/login/logic/login_cubit.dart';
import 'package:test_flutter_app1/core/widgets/password_validations.dart';

class PasswordAndEmail extends StatefulWidget {
  const PasswordAndEmail({super.key});

  @override
  State<PasswordAndEmail> createState() => _PasswordAndEmailState();
}

class _PasswordAndEmailState extends State<PasswordAndEmail> {
  bool isObscureTextState = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  //  late TextEditingController emialController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordCcontroller;
    // emialController = context.read<LoginCubit>().emailCcontroller;
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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailCcontroller,
            validator: (value) {
             if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "please enter your Eamil";
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "Password",
            controller: context.read<LoginCubit>().passwordCcontroller,
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
          
            validator: (value) {
              if (value == null || value.isEmpty||
                  !AppRegex.isPasswordValid(value) ) {
                return "please enter your valid Password";
              }
            },
          ),
          verticalSpace(8),
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
