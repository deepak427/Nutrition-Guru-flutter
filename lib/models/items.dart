import 'package:nutrition_guru/models/Item.dart';
import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  //Item for sale
  final List<Item> _shop = [
    //Item 1
    Item(
      name: "Nutritionist AI",
      price: 99.99,
      description:
          "Nutritionist AI leverages artificial intelligence to give health insights about a Item.",
      imageUrl: 'assests/nutritionist_animation.json',
    ),
    //Item 2
    Item(
      name: "Calorie Predictor",
      price: 9.99,
      description:
          "Calorie predictor predicts the total calories in a given image of food.",
      imageUrl: 'assests/calorie_animation.json',
    ),
    // Item 3
    Item(
      name: "Diet Planner",
      price: 999.99,
      description:
          "Diet planner plans the perfect diet according to the user's requirements, considering various factors like age, sex, location, health, etc.",
      imageUrl: 'assests/calorie_animation.json',
    ),
    Item(
      name: "Store",
      price: 999.99,
      description:
          "In this store, you can find all the Items that will help you stay healthy. This store contains nutrition Items from small to large locations.",
      imageUrl: 'assests/calorie_animation.json',
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
