import 'package:dartz/dartz.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';

abstract class ProductsRepository extends BaseRepository {
  Future<Either<Failure, List<ProductEntity>>> getAll();
  Future<Either<Failure, ProductEntity>> get(int id);
}
