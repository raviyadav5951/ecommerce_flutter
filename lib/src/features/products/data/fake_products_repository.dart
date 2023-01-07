import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

//Created private constructor to avoid creating new instances on every usecase
class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  FakeProductsRepository._();

  static FakeProductsRepository instance = FakeProductsRepository._();

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
