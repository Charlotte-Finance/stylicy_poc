import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc/models/products/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: _ProductCard(
            product: products[index],
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 6,
      child: Row(
        children: [
          Container(
            height: height * 0.2,
            width: height * 0.16,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height * 0.15 * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${product.price} €",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width * 0.2,
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
