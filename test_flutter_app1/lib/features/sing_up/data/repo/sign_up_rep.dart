
import 'package:test_flutter_app1/core/networking/api_error_handeller.dart';
import 'package:test_flutter_app1/core/networking/api_result.dart';
import 'package:test_flutter_app1/core/networking/api_service.dart';
import 'package:test_flutter_app1/features/login/data/models/login_response.dart';
import 'package:test_flutter_app1/features/sing_up/data/models/sign_up_request_body.dart';
import 'package:test_flutter_app1/features/sing_up/data/models/sign_up_response.dart';

class SignUpRep {
  final ApiService _apiService;
  SignUpRep(this._apiService);

  Future<ApiResult<SignupResponse>> signUp(SignupRequestBody SignupRequestBody ) async {
 try {
      final respone = await _apiService.signup(SignupRequestBody);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  

}