import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/features/products_page/domain/repository/products_repository.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';

@LazySingleton()
class GetProductsUseCase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase(this.productsRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productsRepository.getAll();
  }
}
