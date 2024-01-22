import 'package:flutter/material.dart';
import 'package:nutrition_guru/components/my_product_tile.dart';
import 'package:nutrition_guru/models/service.dart';
import 'package:provider/provider.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Service>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Store"),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            //shop subtitle
            const SizedBox(
              height: 50,
            ),

            //service list

            SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
