import 'package:api_demo/products/mapper/base_mapper.dart';
import 'package:api_demo/products/model/product.dart';
import 'package:api_demo/products/model/product_entity.dart';

class ProductApiEntityToProductMapper
    extends BaseMapper<ProductApiEntity, Product> {
  @override
  Product map(ProductApiEntity t) {
    return Product(
      title: t.name,
      listingPrice: t.price?.listingPrice,
      sellingPrice: t.price?.sellingPrice,
      category: t.category?.title,
      ratings: t.ratings?.avgRatings,
      noOfReviews: t.ratings?.noOfReview,
    );
  }
}
