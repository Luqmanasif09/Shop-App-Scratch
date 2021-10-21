import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Provider/product_provider.dart';

class Description extends StatelessWidget {
  static const routename = '/description';

  @override
  Widget build(BuildContext context) {
    final Id = ModalRoute.of(context)!.settings.arguments as String;
    final Pro_details = Provider.of<ProviderProduct>(context).Find_by_Id(Id);

    return Scaffold(
      appBar: AppBar(
        title: Text(Pro_details.title),
      ),
    );
  }
}
