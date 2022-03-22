part of 'product_list_bloc.dart';

enum ProductListStatus { initial, loading, success, failure }

@JsonSerializable()
class ProductListState extends Equatable {
  final ProductListStatus status;
  final List<Product> products;

  ProductListState({
    this.status = ProductListStatus.initial,
    List<Product>? products,
  }) : products = products ?? [];

  ProductListState copyWith({
    ProductListStatus? status,
    List<Product>? products,
  }) {
    return ProductListState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [status, products];
}
