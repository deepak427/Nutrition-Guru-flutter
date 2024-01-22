import 'package:flutter/material.dart';
import 'package:nutrition_guru/components/my_item_tile.dart';
import 'package:nutrition_guru/models/items.dart';
import 'package:provider/provider.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<Items>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Store"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // Shop subtitle
          const SizedBox(
            height: 10,
          ),

          // Service list
          ListView.builder(
            shrinkWrap: true, // Important for nested ListView
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return MyItemTile(item: item);
            },
          ),
        ],
      ),
    );
  }
}
