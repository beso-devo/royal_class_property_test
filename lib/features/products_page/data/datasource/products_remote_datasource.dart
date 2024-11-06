import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:royal_class_flutter_test/core/data/models/product_entity.dart';
import 'package:royal_class_flutter_test/core/network/models/base_list_response_model.dart';
import 'package:royal_class_flutter_test/core/network/models/base_response_model.dart';
import 'package:royal_class_flutter_test/core/util/constants.dart';
import '../../../../core/data/models/base_remote_datasource.dart';

abstract class ProductsRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseListResponseModel<ProductEntity>> getAll(String token, String url);

  Future<BaseResponseModel<ProductEntity>> get(
      String token, String url, int productId);
}

@LazySingleton(as: ProductsRemoteDataSource)
class MainPageRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ProductsRemoteDataSource {
  MainPageRemoteDataSourceImpl({required super.dio});

  @override
  Future<BaseListResponseModel<ProductEntity>> getAll(
      String token, String url) async {
    final result = await dio.get(url + Endpoints.products,
        options: GetOptions.getOptionsWithToken(token));
    List<ProductEntity> products = [];
    List data = jsonDecode(result.data);
    for (int i = 0; i < data.length; i++) {
      products.add(ProductEntity.fromJson(data[i]));
    }

    print("ppopo = ${result.data}");
    print("pppp = ${products.length}");

    return BaseListResponseModel(data: products);
  }

  @override
  Future<BaseResponseModel<ProductEntity>> get(
      String token, String url, int productId) async {
    return BaseResponseModel(data: null);
  }
}
