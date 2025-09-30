
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_app1/features/login/logic/login_state.dart';
import 'package:test_flutter_app1/features/sing_up/data/models/sign_up_request_body.dart';
import 'package:test_flutter_app1/features/sing_up/data/repo/sign_up_rep.dart';
import 'package:test_flutter_app1/features/sing_up/logic/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRep _signUpRep;
  SignUpCubit(this._signUpRep): super(SignUpState.initial());
  TextEditingController emailCcontroller=TextEditingController();
  TextEditingController passwordCcontroller=TextEditingController();
  TextEditingController confirmPasswordCcontroller=TextEditingController();
  TextEditingController phoneCcontroller=TextEditingController();
  final formKey=GlobalKey<FormState>();

  void sigunUp()async{
    // Form is valid, proceed with submission logic
      // You can access the form values using the controllers
      final email = emailCcontroller.text;
      final password = passwordCcontroller.text;
      final confirmPassword = confirmPasswordCcontroller.text;
      final phone =phoneCcontroller.text;

      // Implement your submission logic here
      print('Email: $email');
      print('Password: $password');
      print('Confirm Password: $confirmPassword');
      print('Phone: $phone');
      emit(const SignUpState.loading());
      final response = await _signUpRep.signUp(
      SignupRequestBody(
        name: "Maged",
        gender: 1,
        email: emailCcontroller.text,
        phone: phoneCcontroller.text , 
        password:passwordCcontroller.text ,
        passwordConfirmation: confirmPasswordCcontroller.text));
        response.when(
      success: (signUpRep) {
        emit(SignUpState.success(signUpRep));
      },
      failure: (error) {
        emit(SignUpState.error(error.apiErrorModel.message ?? ""));
      },
    );
    // final result=await signUpRep.signUp(emailCcontroller.text, passwordCcontroller.text, confirmPasswordCcontroller.text, phoneCcontroller.text);
    // result.fold((l) {
    //   emit(state.copyWith(isLoading: false,errorMessage: l.message));
    // }, (r) {
    //   emit(state.copyWith(isLoading: false,errorMessage: ''));
    // });
  }

}