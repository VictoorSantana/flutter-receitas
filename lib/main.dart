import 'package:cardsapp/data/dummy_data.dart';
import 'package:cardsapp/screens/meal_detail_screen.dart';
import 'package:cardsapp/screens/settings_screen.dart';
import 'package:cardsapp/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';

import 'utils/app_routes.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6:  TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      //home: CategoriesScreen(), <-- important retirar
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },     
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) {
            //se tentar entrar em uma rota que não consiguio
            //404
            return CategoriesScreen();
          }
        );
      },
    );
  }
}
 