import 'package:dartz/dartz.dart';
import 'package:royal_class_flutter_test/core/domain/entity/user_entity.dart';
import 'package:royal_class_flutter_test/features/sign_up/domain/usecases/continue_as_guest_usecase.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/error/failures.dart';
import '../usecases/sign_up_usecase.dart';

abstract class SignUpRepository extends BaseRepository {
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params);
  Future<Either<Failure, UserEntity>> continueAsGuest(ContinueAsGuestParams params);
}
