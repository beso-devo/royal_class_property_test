import 'package:built_value/built_value.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/core/error/failures.dart';

part 'products_state.g.dart';

abstract class ProductsState
    implements Built<ProductsState, ProductsStateBuilder> {
  ProductsState._();

  List<ProductEntity> get products;

  bool get isLoadingProducts;

  bool get errorLoadingProducts;

  bool get productsLoaded;

  Failure? get failure;


  // I just put this one here to saving time only!.
  List<ProductEntity> get cartProducts;

  factory ProductsState([Function(ProductsStateBuilder b) updates]) =
      _$ProductsState;

  factory ProductsState.initial() {
    return ProductsState((b) => b
      ..products = []
      ..cartProducts = []
      ..isLoadingProducts = false
      ..errorLoadingProducts = false
      ..productsLoaded = false);
  }
}
