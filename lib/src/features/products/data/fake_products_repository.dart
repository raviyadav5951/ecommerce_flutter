import 'dart:async';

import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//created a riverpod provider
///1. GLobally declared
///2. Mention type
///3. body is required

final productsRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});

/// Creating a StreamProvider
final productsListStreamProvider = StreamProvider<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  final productsList = productsRepository.watchProductsList();
  return productsList;
});

///Creating a FutureProvider
final productsListFutureProvider = FutureProvider<List<Product>>((ref) {
  final productsRepoProvider = ref.watch(productsRepositoryProvider);
  final productsList = productsRepoProvider.fetchProductsList();
  return productsList;
});

/// Stream provider using the family modifier
/// modifier is used to send parameters to provider method
///Added autodispose
final productProvider =
    StreamProvider.autoDispose.family<Product?, String>((ref, id) {
  // debugPrint('product provider created');
  //ref.onDispose(() => debugPrint('productProvider disposed'));
  // final link = ref.keepAlive();
  // Timer(const Duration(seconds: 5), () {
  //   link.close();
  // });
  final productsRepoProvider = ref.watch(productsRepositoryProvider);
  final product = productsRepoProvider.watchProduct(id);
  return product;
});

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() => _products;

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  //Create same methods for future and stream support

  Future<List<Product>> fetchProductsList() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() async* {
    await Future.delayed(const Duration(
        seconds: 2)); //to show delay and test the provider loading case
    // return Stream.value(_products);
    yield _products;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}
