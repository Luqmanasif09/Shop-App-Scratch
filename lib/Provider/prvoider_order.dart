import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Provider/product_cart.dart';

class Order_items {
  final String id;
  final double amount;
  final List<Cart_item> Products_List;
  final DateTime Date;

  Order_items(
      {required this.Date,
      required this.Products_List,
      required this.amount,
      required this.id});
}

class Order with ChangeNotifier {
  List<Order_items> Order_List = [];

  List<Order_items> get orders {
    return [...Order_List];
  }

  void Addorder(List<Cart_item> pro_cart, double total) {
    Order_List.insert(
      0,
      Order_items(
          Date: DateTime.now(),
          Products_List: pro_cart,
          amount: total,
          id: DateTime.now().toString()),
    );
    notifyListeners();
  }
}
