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
          "Nutritionist AI leverages artificial intelligence to give health insights about a product.",
      animationPath: 'assests/nutritionist_animation.json',
      routePath: "/nutritionist_ai_page",
    ),
    //product 2
    Product(
      name: "Calorie Predictor",
      price: 9.99,
      description:
          "Calorie predictor predicts the total calories in a given image of food.",
      animationPath: 'assests/calorie_animation.json',
      routePath: "/calorie_predictor_page",
    ),
    // product 3
    Product(
      name: "Diet Planner",
      price: 999.99,
      description:
          "Diet planner plans the perfect diet according to the user's requirements, considering various factors like age, sex, location, health, etc.",
      animationPath: 'assests/diet_animation.json',
      routePath: "/diet_planner_page",
    ),
    Product(
      name: "Store",
      price: 999.99,
      description:
          "In this store, you can find all the products that will help you stay healthy. This store contains nutrition products from small to large locations.",
      animationPath: 'assests/store_animation.json',
      routePath: "/store_page",
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
