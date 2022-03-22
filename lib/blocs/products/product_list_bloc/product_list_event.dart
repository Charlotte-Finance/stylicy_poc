part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class FetchProductList extends ProductListEvent {
  const FetchProductList();

  @override
  List<Object> get props => [];
}
