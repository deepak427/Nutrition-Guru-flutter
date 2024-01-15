import 'package:e_shop/models/shop.dart';
import 'package:e_shop/pages/cart_page.dart';
import 'package:e_shop/pages/nutritionist_ai_page.dart';
import 'package:e_shop/pages/shop_page.dart';
import 'package:e_shop/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/intro_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/nutritionist_ai_page': (context) => const NutritionistAiPage(),
      },
    );
  }
}
