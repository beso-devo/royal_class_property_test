import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/core/domain/usecases/usecase.dart';
import 'package:royal_class_flutter_test/features/products_page/domain/usecases/get_products_usecase.dart';
import 'package:royal_class_flutter_test/features/products_page/presentation/bloc/products_state.dart';
import 'products_event.dart';

@Injectable()
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;

  ProductsBloc(this.getProductsUseCase) : super(ProductsState.initial());

  onGetProducts() {
    add(GetProducts());
  }

  onGetProductById(int id) {
    add(GetProductById(id));
  }

  onAddToCart(ProductEntity product) {
    add(AddToCart(product));
  }

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is GetProducts) {
      yield* getProducts();
    } else if (event is AddToCart) {
      state.cartProducts.add(event.product);
      state.rebuild((p) => p);
    }
  }

  Stream<ProductsState> getProducts() async* {
    yield state.rebuild((p) => p
      ..isLoadingProducts = true
      ..errorLoadingProducts = false
      ..productsLoaded = false);
    final result = await getProductsUseCase(NoParams());
    yield* result.fold((l) async* {
      yield state.rebuild((p) => p
        ..failure = l
        ..isLoadingProducts = false
        ..errorLoadingProducts = true
        ..productsLoaded = false);
    }, (r) async* {
      yield state.rebuild((p) => p
        ..isLoadingProducts = false
        ..errorLoadingProducts = false
        ..productsLoaded = true
        ..products = r);
    });
  }
}
