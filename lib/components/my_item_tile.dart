import 'package:nutrition_guru/models/item.dart';
import 'package:nutrition_guru/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyItemTile extends StatelessWidget {
  final Item item;

  const MyItemTile({
    super.key,
    required this.item,
  });

  //add to cart
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add this product to cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              //add to cart
              context.read<Items>().addToCart(item);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<Items>().cart;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //item image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Image.asset(item.imageUrl, fit: BoxFit.cover),
                ),
              ),

              const SizedBox(height: 25),

              //service name
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              //product description
              Text(
                item.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // price + add to cart button

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text('\$${item.price.toStringAsFixed(2)}'),

              //add button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(12)),
                child: !cartItems.contains(item)
                    ? IconButton(
                        onPressed: () => addToCart(context),
                        icon: const Icon(Icons.add),
                      )
                    : const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.check),
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}
