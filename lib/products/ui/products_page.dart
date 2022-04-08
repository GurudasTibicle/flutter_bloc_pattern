import 'package:api_demo/products/bloc/products_bloc.dart';
import 'package:api_demo/products/model/product.dart';
import 'package:api_demo/products/repository/products_repo.dart';
import 'package:api_demo/products/state/base_ui_state.dart';
import 'package:api_demo/products/ui/product_list_item_widget.dart';
import 'package:api_demo/products/ui/search_page.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  ProductsBloc _productsBloc = ProductsBloc();

  @override
  void initState() {
    super.initState();
    _productsBloc.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.search,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SearchPage()));
        },
      ),
      body: StreamBuilder<BaseUiState<List<Product>>>(
          stream: _productsBloc.getProductsStateStream,
          builder: (context, snapshot) {
            final state = snapshot.data;

            if (state == null || state.isLoading()) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.isError()) {
              return const Center(
                child: Text(
                  'Something went wrong...'
                ),
              );
            }

            final products = state.data ?? <Product>[];

            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemBuilder: (ctx, index) {
                return ProductListItemWidget(
                  product: products[index],
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: products.length,
            );
          }),
    );
  }
}
