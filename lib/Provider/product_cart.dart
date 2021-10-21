import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Cart_item {
  final String id;
  final String title;
  final double price;
  final int quantity;

  Cart_item(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});
}

class Cart with ChangeNotifier {
  Map<String, Cart_item> _items = {};

  double get Total_Amount {
    double total_num = 0.0;
    _items.forEach(
      (key, value) {
        total_num += value.price * value.quantity;
      },
    );
    return total_num;
  }

  Map<String, Cart_item> get Cart_data {
    return {..._items};
  }

  void Remove_cart(String Pid) {
    _items.remove(Pid);
    notifyListeners();
  }

  int get Items_count {
    return _items.length;
  }

  void Remove_one_item(String Pid) {
    if (!_items.containsKey(Pid)) {
      return;
    }

    if (_items[Pid]!.quantity > 1) {
      _items.update(
        Pid,
        (value) => Cart_item(
            id: value.id,
            price: value.price,
            quantity: value.quantity - 1,
            title: value.title),
      );
    } else {
      _items.remove(Pid);
    }
    notifyListeners();
  }

  void Add_Quantity(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (items) => Cart_item(
              id: items.id,
              price: items.price,
              quantity: items.quantity + 1,
              title: items.title));
    } else {
      _items.putIfAbsent(
          id, () => Cart_item(id: id, price: price, quantity: 1, title: title));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
