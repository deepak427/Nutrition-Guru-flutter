import 'package:e_shop/components/my_drawer.dart';
import 'package:e_shop/components/my_product_tile.dart';
import 'package:e_shop/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Nutrition Page"),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            //shop subtitle
            const SizedBox(
              height: 25,
            ),

            Center(
              child: Text(
                "Pick from selected list of premium Services",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),

            const SizedBox(
              height: 60,
            ),

            //product list

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
