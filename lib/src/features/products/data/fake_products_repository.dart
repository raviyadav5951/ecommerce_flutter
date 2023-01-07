import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//created a riverpod provider
///1. GLobally declared
///2. Mention type
///3. body is required
final productsRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() => _products;

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  //Create same methods for future and stream support

  Future<List<Product>> fetchProductsList() {
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}
