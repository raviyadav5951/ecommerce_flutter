import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/not_found/not_found_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/product_page/product_screen.dart';
import 'package:ecommerce_app/src/features/products_list/products_list_screen.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Enum of all routes : Routing by name (code will be less error prone)
enum Approute {
  home,
  account,
  orders,
  signin,
  cart,
  product,
}

final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          name: Approute.home.name,
          builder: ((context, state) =>
              const ProductsListScreen()), //this will provide a default transition (right to left)
          routes: [
            GoRoute(
              path: 'product/:id',
              name: Approute.product.name,
              builder: (context, state) {
                final productId = state.params['id']!;
                return ProductScreen(
                  productId: productId,
                );
              },
            ),
            GoRoute(
              name: Approute.cart.name,
              path: 'cart',
              pageBuilder: ((context, state) => MaterialPage<void>(
                    // passed material page to show full screen route(close icon)
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const ShoppingCartScreen(),
                  )),
            ),
            GoRoute(
              name: Approute.account.name,
              path: 'account',
              pageBuilder: ((context, state) => MaterialPage<void>(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const AccountScreen(),
                  )),
            ),
            GoRoute(
              name: Approute.orders.name,
              path: 'orders',
              pageBuilder: ((context, state) => MaterialPage<void>(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const OrdersListScreen(),
                  )),
            ),
            GoRoute(
              path: 'signin',
              name: Approute.signin.name,
              pageBuilder: ((context, state) => MaterialPage<void>(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const EmailPasswordSignInScreen(
                      formType: EmailPasswordSignInFormType.signIn,
                    ),
                  )),
            ),
          ]),
    ],
    errorBuilder: (context, state) => const NotFoundScreen());
