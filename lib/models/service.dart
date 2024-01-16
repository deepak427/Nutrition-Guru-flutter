import 'package:nutrition_guru/models/product.dart';
import 'package:flutter/material.dart';

class Service extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: "Nutritionist AI",
      price: 99.99,
      description:
          "A Nutritionist AI service leverages artificial intelligence to provide personalized and automated nutritional guidance.",
      imagePath: 'assests/cake.png',
    ),
    //product 2
    Product(
      name: "Product2",
      price: 9.99,
      description: "this is description",
      imagePath: 'assests/cake.png',
    ),
    //product 3
    Product(
      name: "Product3",
      price: 999.99,
      description: "this is description",
      imagePath: 'assests/cake.png',
    ),
  ];

  //user cart

  final List<Product> _cart = [];

  //get products list

  List<Product> get shop => _shop;

  //get user cart

  List<Product> get cart => _cart;

  //add item to cart

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
