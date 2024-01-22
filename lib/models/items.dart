import 'package:nutrition_guru/models/item.dart';
import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  //Item for sale
  final List<Item> _shop = [
    //Item 1
    Item(
      name: "Whey Protien",
      price: 99.99,
      description:
          "Whey protein is a high-quality protein derived from milk. It contains essential amino acids, promoting muscle growth, recovery, and overall fitness. It's popular among athletes and fitness enthusiasts.",
      imageUrl: 'assests/images/whey.jpg',
    ),
    //Item 2
    Item(
      name: "Ragi",
      price: 9.99,
      description:
          "Ragi is a nutrient-dense grain rich in calcium, iron, and fiber. It's gluten-free and often used in various cuisines for its health benefits, aiding in digestion and managing diabetes.",
      imageUrl: 'assests/images/ragi.jpg',
    ),
    // Item 3
    Item(
      name: "Bhangjira",
      price: 999.99,
      description:
          "Bhangira, or chia seeds, are tiny powerhouses packed with omega-3 fatty acids, fiber, and antioxidants. They offer numerous health benefits, including supporting heart health, promoting hydration, and aiding in weight management.",
      imageUrl: 'assests/images/chia-seeds.jpg',
    ),
  ];

  //user cart

  final List<Item> _cart = [];

  //get Items list

  List<Item> get shop => _shop;

  //get user cart

  List<Item> get cart => _cart;

  //add item to cart

  void addToCart(Item item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart

  void removeFromCart(Item item) {
    _cart.remove(item);
    notifyListeners();
  }
}
