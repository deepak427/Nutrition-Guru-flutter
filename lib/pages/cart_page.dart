import 'package:nutrition_guru/models/item.dart';
import 'package:nutrition_guru/models/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemFromCart(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this product to cart?"),
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
              context.read<Items>().removeFromCart(item);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Items>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      //return as cart title UI
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            tileColor: Theme.of(context).colorScheme.primary,
                            contentPadding: const EdgeInsets.all(8),
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            subtitle: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
