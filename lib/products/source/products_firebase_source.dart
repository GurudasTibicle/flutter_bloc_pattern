import 'package:api_demo/products/model/product.dart';
import 'package:api_demo/products/model/product_firebase_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsFirebaseSource {
  Future<List<Product>> getProducts() {
    return FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((value) {
      final docs = value.docs;

      final products = <ProductFirebaseEntity>[];

      docs.forEach((element) {
        products.add(ProductFirebaseEntity.fromJson(element.data()));
      });

      final productsToSend = <Product>[];

      products.forEach((element) {
        productsToSend.add(Product(
          title: element.name,
          category: element.category,
          sellingPrice: element.sellingPrice,
          listingPrice: element.listingPrice,
          ratings: element.ratings,
          noOfReviews: element.noOfReviews,
        ));
      });

      return productsToSend;
    });
  }
}
