import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Screen/order_screen.dart';
import '/Provider/product_data.dart';
import '/Provider/product_provider.dart';
import '/Widget/product_manage.dart';
import '/Widget/app_drawer.dart';
import '/Screen/add_cart_screen.dart';

class UserProduct extends StatelessWidget {
  static const routename = '/ProductManage';
  @override
  Widget build(BuildContext context) {
    final Pro = Provider.of<ProviderProduct>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (_, index) => ProductManagae(
            id: Pro.items[index].id,
            ImgUrl: Pro.items[index].imageUrl,
            title: Pro.items[index].title,
          ),
          itemCount: Pro.items.length,
        ),
      ),
    );
  }
}
