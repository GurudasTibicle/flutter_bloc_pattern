import 'package:api_demo/products/app_constants.dart';
import 'package:api_demo/products/model/product_entity.dart';
import 'package:api_demo/products/ui/product_list_item_widget.dart';
import 'package:api_demo/rest/rest_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
        ),
      ),
      body: FutureBuilder<Response>(
          //future: FirebaseFirestore.instance.collection('products').get(),
          future: RestClient().getDio().get('/search'),
          builder: (context, snapshot) {
            final data = snapshot.data;

            if (data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            print('//// DATA: ${data.data}');
            final docs = data.data;

            if (docs.isEmpty) {
              return const Center(
                child: Text(
                  'No Data Found!',
                ),
              );
            }
            final products = <ProductApiEntity>[];

            docs.forEach((element) {
              final map = element;
              products.add(ProductApiEntity.fromJson(map));
            });

            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemBuilder: (ctx, index) {
                // return ProductListItemWidget(
                //   product: products[index],
                // );
                return Container(
                  height: 100,
                  color: Colors.yellow,
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
