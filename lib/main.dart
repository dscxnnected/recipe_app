import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_app/recipelistpage.dart';
import 'package:recipe_app/recipesheetsapi.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RecipeSheetsApi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeListPage(),
    );
  }
}
