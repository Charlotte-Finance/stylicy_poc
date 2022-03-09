import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc/models/product/product.dart';
import 'package:poc/repositories/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepository;

  ProductListBloc({required this.productRepository})
      : super(ProductListState()) {
    on<FetchProductList>(_onFetch);
  }

  Future<void> _onFetch(
      FetchProductList event, Emitter<ProductListState> emit) async {
    emit(state.copyWith(status: ProductListStatus.loading));
    try {
      List<Product> products = await productRepository.getProducts();
      return emit(
        state.copyWith(
          status: ProductListStatus.success,
          products: products,
        ),
      );
    } catch (_) {
      return emit(
        state.copyWith(status: ProductListStatus.failure),
      );
    }
  }
}
