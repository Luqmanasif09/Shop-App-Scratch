import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier {
  late String id;
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  bool Is_favourite;

  Product(
      {required this.id,
      this.Is_favourite = false,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.title});

  void Favourite_toggle() {
    Is_favourite = !Is_favourite;
    notifyListeners();
  }
}
