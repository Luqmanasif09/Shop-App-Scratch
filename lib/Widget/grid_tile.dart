import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Provider/product_provider.dart';
import 'package:shopapp/Screen/product_details.dart';

class ProductGrid extends StatelessWidget {
  final bool Is_fav;
  ProductGrid(this.Is_fav);

  @override
  Widget build(BuildContext context) {
    final Pro = Provider.of<ProviderProduct>(context);
    final Pro_List = Is_fav ? Pro.Favourite : Pro.items;

    return GridView.builder(
      padding: EdgeInsets.all(15),
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: Pro_List[index],
        child: ProductDisplay(),
      ),
      itemCount: Pro_List.length,
    );
  }
}
