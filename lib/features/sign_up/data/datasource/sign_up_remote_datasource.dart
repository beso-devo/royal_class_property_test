import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal_class_flutter_test/core/domain/entity/user_entity.dart';
import 'package:royal_class_flutter_test/features/sign_up/data/services/auth_service.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../core/data/models/base_remote_datasource.dart';
import '../../domain/usecases/continue_as_guest_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

abstract class SignUpRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<UserEntity>> signUp(SignUpParams params);

  Future<BaseResponseModel<UserEntity>> continueAsGuest(
      ContinueAsGuestParams params);
}

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignUpRemoteDataSource {
  SignUpRemoteDataSourceImpl({required super.dio});

  @override
  Future<BaseResponseModel<UserEntity>> signUp(SignUpParams params) async {
    /// Here we can do the request from the backend and for sure we should make the
    /// conditions and implement the code to handle the errors and display it using
    /// `FlushBarMixin` widget or something like it...

    // final result = await dio.post(Endpoints.BASE_URL + Endpoints.REGISTER,
    //     data: jsonEncode(params.toMap()));
    //
    // return BaseResponseModel(
    //     data: UserEntity.fromJson(json.decode(result.data)['result']));

    AuthService authService = AuthService();
    User? user = await authService.signUpWithEmailPassword(
        params.email, params.password);

    if (user != null) {
      return BaseResponseModel(
          data: UserEntity(id: 1, isVerified: true, balance: 5000));
    } else {
      return BaseResponseModel(data: null, message: "Error Signing up!");
    }
  }

  @override
  Future<BaseResponseModel<UserEntity>> continueAsGuest(
      ContinueAsGuestParams params) async {
    return BaseResponseModel(
        data: UserEntity(id: 1, isVerified: false, balance: 4000));
  }
}
