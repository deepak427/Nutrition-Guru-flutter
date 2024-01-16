import 'package:nutrition_guru/models/product.dart';
import 'package:nutrition_guru/models/service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product,
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
              context.read<Service>().addToCart(product);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/nutritionist_ai_page'),
      child: Container(
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
                //product image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    child: Lottie.asset("assests/nutritionist_animation.json",
                        fit: BoxFit.cover),
                  ),
                ),

                const SizedBox(height: 25),

                //product name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 10),

                //product description
                Text(
                  product.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),

            // price + add to cart button

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     //product price
            //     Text('\$${product.price.toStringAsFixed(2)}'),

            //     //add button
            //     Container(
            //       decoration: BoxDecoration(
            //           color: Theme.of(context).colorScheme.onSecondary,
            //           borderRadius: BorderRadius.circular(12)),
            //       child: IconButton(
            //         onPressed: () => addToCart(context),
            //         icon: const Icon(Icons.add),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
