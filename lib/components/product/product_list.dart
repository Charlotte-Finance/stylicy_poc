import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc/models/product/product.dart';

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
        return Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(Icons.icecream),
            title: Text(products[index].title),
            subtitle: Text(products[index].description),
            trailing: Icon(Icons.food_bank),
          ),
        );
      },
    );
  }
}
