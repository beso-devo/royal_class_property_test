import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/domain/entity/user_entity.dart';
import 'usecase.dart';
import '../../error/failures.dart';
import '../../../features/sign_in/domain/repository/sign_in_repository.dart';

/// I implemented this `usecase` here in core folder because we are using it
/// in more than one place, to avoid repeating it in somewhere in project
/// so I implemented here ...
///
/// Any `usecase` we're using it in the project with more than one place so we have
/// to implement it here in core folder .....
///

@LazySingleton()
class GetUserInfoUseCase extends UseCase<UserEntity, NoParams> {
  final SignInRepository signInRepository;

  GetUserInfoUseCase(this.signInRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await signInRepository.getCurrentUser();
  }
}
