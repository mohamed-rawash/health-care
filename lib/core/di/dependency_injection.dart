import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/core/networking/dio_factory.dart';
import 'package:health_care/features/login/data/repositories/login_repository.dart';
import 'package:health_care/features/login/logic/login_cubit/login_cubit.dart';

import '../networking/api_service.dart';
final sl = GetIt.instance;

abstract class DependencyInjection {
  static void init() {
    // Dio & ApiService
    Dio dio = DioFactory.getDio();
    sl.registerLazySingleton<ApiService>(() => ApiService(dio));

    // login
    sl.registerLazySingleton<LoginRepository>(() => LoginRepository(sl()));
    sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
  }
}
