import 'package:flutter/material.dart';
import '/Widget/app_drawer.dart';
import '/Widget/grid_tile.dart';
import '/Widget/badge_pro.dart';
import 'package:provider/provider.dart';
import '/Provider/product_cart.dart';
import '/Screen/cart_screen.dart';

enum FilterOption {
  Favourite,
  All,
}

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool Is_Fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Text('Shopping App'),
        actions: [
          PopupMenuButton(
            onSelected: (ctx) => (FilterOption select) {
              setState(
                () {
                  if (select == FilterOption.Favourite) {
                    Is_Fav = true;
                  } else {
                    Is_Fav = false;
                  }
                },
              );
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                child: Text('All Favourite'),
              ),
              const PopupMenuItem(
                child: Text('All Items'),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: IconButton(
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routename);
                },
              ),
              value: cart.Items_count.toString(),
              color: Colors.black54,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(Is_Fav),
    );
  }
}
