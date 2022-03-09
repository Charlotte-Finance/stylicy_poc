import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/blocs/product_list_bloc/product_list_bloc.dart';
import 'package:poc/components/product/product_list.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                switch (state.status){
                  case ProductListStatus.initial:
                    context.read<ProductListBloc>().add(const FetchProductList());
                    break;
                  case ProductListStatus.success:
                    return ProductList(products: state.products);
                  default:
                }
                return const Center(child: CircularProgressIndicator());
              }
          )
        ),
      ),
    );
  }
}

