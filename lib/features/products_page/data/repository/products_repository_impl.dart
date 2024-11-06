import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/data/models/base_local_data_source.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/features/products_page/data/datasource/products_remote_datasource.dart';
import 'package:royal_class_flutter_test/features/products_page/domain/repository/products_repository.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/constants.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl extends BaseRepositoryImpl
    implements ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl({
    required this.productsRemoteDataSource,
    required BaseLocalDataSource basD,
    required this.networkInfo,
  }) : super(
            baseRemoteDataSource: productsRemoteDataSource,
            baseLocalDataSource: basD,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, ProductEntity>> get(int id) async {
    return requestWithToken((token, url) async {
      final result =
          await productsRemoteDataSource.get(token, url, id);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    return requestWithToken((token, url) async {
      final result =
          await productsRemoteDataSource.getAll(token, url);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }
}
