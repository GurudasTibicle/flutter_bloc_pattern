class ProductFirebaseEntity {
  String? name;
  double? ratings;
  int? noOfReviews;
  String? category;
  int? sellingPrice;
  int? listingPrice;

  ProductFirebaseEntity({
    this.name,
    this.ratings,
    this.noOfReviews,
    this.category,
    this.sellingPrice,
    this.listingPrice,
  });

  ProductFirebaseEntity.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    category = map['category'];
    listingPrice = map['listing_price'];
    sellingPrice = map['selling_price'];
    ratings = map['avg_ratings'];
    noOfReviews = map['number_of_reviews'];
  }
}
