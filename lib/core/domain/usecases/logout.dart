import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../data/repository/base_repository.dart';
import '../../error/failures.dart';
import 'usecase.dart';

@LazySingleton()
class LogoutUseCase extends UseCase<bool, LogOutParams> {
  final BaseRepository baseRepository;

  LogoutUseCase(this.baseRepository);

  @override
  Future<Either<Failure, bool>> call(LogOutParams params) async {
    return await baseRepository.logOutUser(params);
  }
}

class LogOutParams {
  final String type;

  LogOutParams(this.type);
}
