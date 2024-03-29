import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutrition_guru/models/items.dart';
import 'package:nutrition_guru/models/questions_list.dart';
import 'package:nutrition_guru/models/service.dart';
import 'package:nutrition_guru/pages/calorie_predictor_page.dart';
import 'package:nutrition_guru/pages/cart_page.dart';
import 'package:nutrition_guru/pages/diet_planner_page.dart';
import 'package:nutrition_guru/pages/nutritionist_ai_page.dart';
import 'package:nutrition_guru/pages/home_page.dart';
import 'package:nutrition_guru/pages/store_page.dart';
import 'package:nutrition_guru/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'lib/.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Service()),
        ChangeNotifierProvider(create: (context) => QuestionList()),
        ChangeNotifierProvider(
          create: (context) => Items(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
        '/home_page': (context) => const HomePage(),
        '/cart_page': (context) => const CartPage(),
        '/nutritionist_ai_page': (context) => const NutritionistAiPage(),
        '/calorie_predictor_page': (context) => const CalorieAiPage(),
        '/diet_planner_page': (context) => const DietPlannerPage(),
        '/store_page': (context) => const StorePage(),
      },
    );
  }
}
