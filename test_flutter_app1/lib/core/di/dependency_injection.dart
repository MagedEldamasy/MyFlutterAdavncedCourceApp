import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_app1/core/networking/api_service.dart';
import 'package:test_flutter_app1/core/networking/dio_factory.dart';
import 'package:test_flutter_app1/features/login/data/repo/login_repo.dart';
import 'package:test_flutter_app1/features/login/logic/login_cubit.dart';
import 'package:test_flutter_app1/features/sing_up/data/repo/sign_up_rep.dart';
import 'package:test_flutter_app1/features/sing_up/logic/sign_up_cubit.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignUpRep>(() => SignUpRep(getIt()));
   getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // // home
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
