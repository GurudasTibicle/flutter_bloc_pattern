import 'package:api_demo/products/model/product.dart';
import 'package:flutter/material.dart';

class ProductListItemWidget extends StatelessWidget {
  final Product product;

  const ProductListItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  product.ratings?.toString() ?? 'N/A',
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '(${product.noOfReviews ?? 0})',
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              product.category ?? '',
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  '${product.listingPrice} INR',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '${product.sellingPrice} INR',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
