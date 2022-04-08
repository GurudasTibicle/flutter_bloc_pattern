import 'package:api_demo/products/model/product.dart';
import 'package:api_demo/products/repository/products_repo.dart';
import 'package:api_demo/products/state/base_ui_state.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  final getProductsStateStream = BehaviorSubject<BaseUiState<List<Product>>>();

  void getProducts() {
    getProductsStateStream.add(BaseUiState.loading());

    ProductsRepo().getProducts().then((products) {
      getProductsStateStream.add(BaseUiState.completed(data: products));
    }).catchError((e) {
      getProductsStateStream.add(BaseUiState.error(e));
    });
  }

  void dispose() {
    getProductsStateStream.close();
  }
}
