import 'package:flutter/material.dart';
import '/Provider/product_provider.dart';
import '/Screen/add_cart_screen.dart';
import 'package:provider/provider.dart';

class ProductManagae extends StatelessWidget {
  final String id;
  final String title;
  final String ImgUrl;

  ProductManagae({required this.ImgUrl, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(ImgUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).errorColor,
            ),
            IconButton(
              onPressed: () {
                Provider.of<ProviderProduct>(context, listen: false)
                    .deleteProduct(id);
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
