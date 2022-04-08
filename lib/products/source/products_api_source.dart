import 'package:api_demo/products/app_constants.dart';
import 'package:api_demo/products/mapper/product_api_entity_to_product_mapper.dart';
import 'package:api_demo/products/model/product_entity.dart';
import 'package:api_demo/rest/rest_client.dart';

import '../model/product.dart';

class ProductsApiSource {
  final RestClient _restClient = RestClient();

  Future<List<Product>> getProducts() {
    return _restClient.getDio().get('/products').then((response) {
      final docs = response.data;

      final products = <ProductApiEntity>[];

      docs.forEach((element) {
        final map = element;
        products.add(ProductApiEntity.fromJson(map));
      });

      final productsToSend = <Product>[];

      products.forEach((element) {
        productsToSend.add(ProductApiEntityToProductMapper().map(element));
      });

      return productsToSend;
    });

  }
}
