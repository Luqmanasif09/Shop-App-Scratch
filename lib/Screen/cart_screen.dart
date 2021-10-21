import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Provider/product_cart.dart';
import '/Widget/cart_items.dart';
import '/Provider/prvoider_order.dart';

class CartScreen extends StatelessWidget {
  static const routename = '/cartscreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  // ignore: prefer_const_constructors
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.Total_Amount.toString()}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).Addorder(
                        cart.Cart_data.values.toList(),
                        cart.Total_Amount,
                      );
                      cart.clear();
                    },
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => Cart_items(
                  Product_id: cart.Cart_data.keys.toList()[i],
                  id: cart.Cart_data.values.toList()[i].id,
                  price: cart.Cart_data.values.toList()[i].price,
                  quantity: cart.Cart_data.values.toList()[i].quantity,
                  title: cart.Cart_data.values.toList()[i].title),
              itemCount: cart.Items_count,
            ),
          ),
        ],
      ),
    );
  }
}
