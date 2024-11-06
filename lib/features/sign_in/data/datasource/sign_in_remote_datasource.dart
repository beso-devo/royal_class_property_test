import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/domain/entity/user_entity.dart';
import '../../../../../core/data/models/base_remote_datasource.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../sign_up/data/services/auth_service.dart';

abstract class SignInRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<UserEntity>> login(String email, String password);
}

@LazySingleton(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignInRemoteDataSource {
  SignInRemoteDataSourceImpl({required super.dio});

  @override
  Future<BaseResponseModel<UserEntity>> login(
      String email, String password) async {
    try {
      /// Here we can do the request from the backend and for sure we should make the
      /// conditions and implement the code to handle the errors and display it using
      /// `FlushBarMixin` widget or something like it...

      // final result = await dio.post(Endpoints.BASE_URL + Endpoints.SIGN_IN,
      //     data: jsonEncode({"username": email.trim(), "password": password}));

      // return BaseResponseModel(
      //     data: UserEntity.fromJson(json.decode(result.data)['result']));

      AuthService authService = AuthService();
      User? user = await authService.signInWithEmailPassword(email, password);

      if (user != null) {
        return BaseResponseModel(
            data: UserEntity(id: 1, isVerified: true, balance: 5000));
      } else {
        return BaseResponseModel(data: null, message: 'Error signing user!');
      }
    } catch (e) {
      if (e is DioException) {
        return BaseResponseModel(
            data: null, message: json.decode(e.response?.data)['result']);
      } else {
        return BaseResponseModel(data: null, message: "");
      }
    }
  }
}
