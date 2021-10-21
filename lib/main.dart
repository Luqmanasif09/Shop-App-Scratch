import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/prvoider_order.dart';
import 'Screen/product_screen.dart';
import 'Provider/product_provider.dart';
import '/Screen/product_desc.dart';
import 'Provider/product_cart.dart';
import 'Screen/cart_screen.dart';
import '/Screen/order_screen.dart';
import 'Screen/user_product.dart';
import 'Screen/add_cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProviderProduct(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Order(),
        ),
      ],
      child: MaterialApp(
        home: ProductScreen(),
        theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.purple,
          backgroundColor: Colors.black,
          errorColor: Colors.red,
        ),
        routes: {
          Description.routename: (ctx) => Description(),
          CartScreen.routename: (ctx) => CartScreen(),
          OrderScreen.routename: (ctx) => OrderScreen(),
          UserProduct.routename: (ctx) => UserProduct(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
