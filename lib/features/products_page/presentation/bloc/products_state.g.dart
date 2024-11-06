// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductsState extends ProductsState {
  @override
  final List<ProductEntity> products;
  @override
  final bool isLoadingProducts;
  @override
  final bool errorLoadingProducts;
  @override
  final bool productsLoaded;
  @override
  final Failure? failure;
  @override
  final List<ProductEntity> cartProducts;

  factory _$ProductsState([void Function(ProductsStateBuilder)? updates]) =>
      (new ProductsStateBuilder()..update(updates))._build();

  _$ProductsState._(
      {required this.products,
      required this.isLoadingProducts,
      required this.errorLoadingProducts,
      required this.productsLoaded,
      this.failure,
      required this.cartProducts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        products, r'ProductsState', 'products');
    BuiltValueNullFieldError.checkNotNull(
        isLoadingProducts, r'ProductsState', 'isLoadingProducts');
    BuiltValueNullFieldError.checkNotNull(
        errorLoadingProducts, r'ProductsState', 'errorLoadingProducts');
    BuiltValueNullFieldError.checkNotNull(
        productsLoaded, r'ProductsState', 'productsLoaded');
    BuiltValueNullFieldError.checkNotNull(
        cartProducts, r'ProductsState', 'cartProducts');
  }

  @override
  ProductsState rebuild(void Function(ProductsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsStateBuilder toBuilder() => new ProductsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsState &&
        products == other.products &&
        isLoadingProducts == other.isLoadingProducts &&
        errorLoadingProducts == other.errorLoadingProducts &&
        productsLoaded == other.productsLoaded &&
        failure == other.failure &&
        cartProducts == other.cartProducts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jc(_$hash, isLoadingProducts.hashCode);
    _$hash = $jc(_$hash, errorLoadingProducts.hashCode);
    _$hash = $jc(_$hash, productsLoaded.hashCode);
    _$hash = $jc(_$hash, failure.hashCode);
    _$hash = $jc(_$hash, cartProducts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsState')
          ..add('products', products)
          ..add('isLoadingProducts', isLoadingProducts)
          ..add('errorLoadingProducts', errorLoadingProducts)
          ..add('productsLoaded', productsLoaded)
          ..add('failure', failure)
          ..add('cartProducts', cartProducts))
        .toString();
  }
}

class ProductsStateBuilder
    implements Builder<ProductsState, ProductsStateBuilder> {
  _$ProductsState? _$v;

  List<ProductEntity>? _products;
  List<ProductEntity>? get products => _$this._products;
  set products(List<ProductEntity>? products) => _$this._products = products;

  bool? _isLoadingProducts;
  bool? get isLoadingProducts => _$this._isLoadingProducts;
  set isLoadingProducts(bool? isLoadingProducts) =>
      _$this._isLoadingProducts = isLoadingProducts;

  bool? _errorLoadingProducts;
  bool? get errorLoadingProducts => _$this._errorLoadingProducts;
  set errorLoadingProducts(bool? errorLoadingProducts) =>
      _$this._errorLoadingProducts = errorLoadingProducts;

  bool? _productsLoaded;
  bool? get productsLoaded => _$this._productsLoaded;
  set productsLoaded(bool? productsLoaded) =>
      _$this._productsLoaded = productsLoaded;

  Failure? _failure;
  Failure? get failure => _$this._failure;
  set failure(Failure? failure) => _$this._failure = failure;

  List<ProductEntity>? _cartProducts;
  List<ProductEntity>? get cartProducts => _$this._cartProducts;
  set cartProducts(List<ProductEntity>? cartProducts) =>
      _$this._cartProducts = cartProducts;

  ProductsStateBuilder();

  ProductsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products;
      _isLoadingProducts = $v.isLoadingProducts;
      _errorLoadingProducts = $v.errorLoadingProducts;
      _productsLoaded = $v.productsLoaded;
      _failure = $v.failure;
      _cartProducts = $v.cartProducts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsState;
  }

  @override
  void update(void Function(ProductsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsState build() => _build();

  _$ProductsState _build() {
    final _$result = _$v ??
        new _$ProductsState._(
            products: BuiltValueNullFieldError.checkNotNull(
                products, r'ProductsState', 'products'),
            isLoadingProducts: BuiltValueNullFieldError.checkNotNull(
                isLoadingProducts, r'ProductsState', 'isLoadingProducts'),
            errorLoadingProducts: BuiltValueNullFieldError.checkNotNull(
                errorLoadingProducts, r'ProductsState', 'errorLoadingProducts'),
            productsLoaded: BuiltValueNullFieldError.checkNotNull(
                productsLoaded, r'ProductsState', 'productsLoaded'),
            failure: failure,
            cartProducts: BuiltValueNullFieldError.checkNotNull(
                cartProducts, r'ProductsState', 'cartProducts'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
