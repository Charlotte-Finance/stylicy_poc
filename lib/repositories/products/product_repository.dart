

import '../../models/products/product.dart';
import '../../utils/http/http_request.dart';

class ProductRepository {
  final String url = "/products/";

  Future<List<Product>> getProducts() async {
    final products = await HttpRequest.getRequest(endpoint: url);
    final parsed = products.cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<Product> getProduct(int productId) async {
    final product = await HttpRequest.getRequest(endpoint: url + '$productId/');
    return Product.fromJson(product);
  }
}
