import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Widget/app_drawer.dart';
import '/Provider/prvoider_order.dart';
import '/Widget/order_items.dart';

class OrderScreen extends StatelessWidget {
  static const routename = '/Order';

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Orderdata(
          orderdata.orders[i],
        ),
        itemCount: orderdata.orders.length,
      ),
    );
  }
}
