import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/product_cart.dart';
import '/Provider/product_data.dart';
import '/Provider/product_provider.dart';
import '/Screen/product_desc.dart';

class ProductDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Items = Provider.of<Product>(context, listen: false);
    final cart_pro = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Description.routename, arguments: Items.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: Image.network(
            Items.imageUrl,
            fit: BoxFit.cover,
            color: Colors.pink[100],
            colorBlendMode: BlendMode.darken,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.grey,
            title: Text(
              Items.title,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            // ignore: prefer_const_constructors
            leading: Consumer<Product>(
              builder: (ctx, Product, child) => IconButton(
                onPressed: Items.Favourite_toggle,
                icon: Icon(
                  Items.Is_favourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.pink[100],
                ),
              ),
            ),

            trailing: IconButton(
              onPressed: () {
                cart_pro.Add_Quantity(Items.id, Items.title, Items.price);

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Add item to cart'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart_pro.Remove_one_item(Items.id);
                      },
                    ),
                  ),
                );
              },
              color: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
