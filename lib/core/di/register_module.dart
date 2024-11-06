import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/validator/input_validators.dart';

@module
abstract class RegisterModule {

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  @lazySingleton
  Dio dio(SharedPreferences sharedPreferences) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.plain,
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        responseHeader: true,
        requestHeader: true,
        request: true,
      ),
    );

    return dio;
  }

  /// Adding the [SharedPreferences] instance to the graph to be later used by the local data sources
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs async {
    return await SharedPreferences.getInstance();
  }

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  InputValidators get inputValidators => InputValidators();
}
