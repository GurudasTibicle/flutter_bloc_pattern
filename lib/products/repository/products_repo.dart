import 'package:api_demo/products/model/product.dart';
import 'package:api_demo/products/source/products_api_source.dart';

class ProductsRepo {
  Future<List<Product>> getProducts() {
    return ProductsApiSource().getProducts();
  }
}