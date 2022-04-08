class ProductApiEntity {
  String? name;
  Category? category;
  Price? price;
  Ratings? ratings;

  ProductApiEntity.fromJson(Map<String, dynamic> map) {
    name = map['title'];
    category = Category.fromJson(map['category']);
    price = Price.fromJson(map['price']);
    ratings = Ratings.fromJson(map['ratings']);
  }
}

class Category {
  String? title;

  Category.fromJson(Map<String, dynamic> map) {
    title = map['title'];
  }
}

class Price {
  int? sellingPrice;
  int? listingPrice;

  Price.fromJson(Map<String, dynamic> map) {
    sellingPrice = map['selling_price'];
    listingPrice = map['listing_price'];
  }
}

class Ratings {
  double? avgRatings;
  int? noOfReview;

  Ratings.fromJson(Map<String, dynamic> map) {
    avgRatings = map['avg'];
    noOfReview = map['reviews_count'];
  }
}