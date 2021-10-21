import 'package:flutter/material.dart';
import '/Provider/prvoider_order.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Orderdata extends StatefulWidget {
  final Order_items order;
  Orderdata(this.order);

  @override
  State<Orderdata> createState() => _OrderdataState();
}

class _OrderdataState extends State<Orderdata> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount.toStringAsFixed(1)}'),
            subtitle: Text(
              DateFormat("dd mm yyyy hh:mm").format(widget.order.Date),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(
                  () {
                    _expand = !_expand;
                  },
                );
              },
              icon: Icon(_expand ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (_expand)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.Products_List.length * 20 + 10, 100),
              child: ListView(
                children: widget.order.Products_List
                    .map(
                      (pro) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pro.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${pro.quantity}x\$${pro.price}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
