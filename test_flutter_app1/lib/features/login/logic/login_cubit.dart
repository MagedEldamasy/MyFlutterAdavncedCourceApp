import 'package:flutter/material.dart';
import 'package:test_flutter_app1/features/login/data/models/login_request_body.dart';
import 'package:test_flutter_app1/features/login/data/repo/login_repo.dart';
import 'package:test_flutter_app1/features/login/logic/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController passwordCcontroller = TextEditingController();
  TextEditingController emailCcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailCcontroller.text,
        password: passwordCcontroller.text,
      ),
    );
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error.apiErrorModel.message ?? ""));
      },
    );
  }
}
