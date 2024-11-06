import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';

abstract class ProductsEvent {}

class GetProducts extends ProductsEvent {}

class GetProductById extends ProductsEvent {
  final int id;

  GetProductById(this.id);
}

class AddToCart extends ProductsEvent {
  final ProductEntity product;

  AddToCart(this.product);
}
