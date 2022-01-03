import 'package:flutter/cupertino.dart';

class Recipe {
  String name = '';
  String description = '';
  bool isVegan = false;
  bool isVegetarian = false;
  int servings = 0;
  int cookTime = 0;
  int prepTime = 0;
  //List<String> instructions = <String>[];
  //List<String>? ingredients;

  Recipe({
    required this.name,
    required this.description,
    required this.isVegan,
    required this.isVegetarian,
    required this.servings,
    required this.cookTime,
    required this.prepTime,
    /*this.instructions, this.ingredients*/
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['title'];
    description = json['description'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    servings = json['servings'];
    cookTime = json['cookTime'];
    prepTime = json['prepTime'];
    //instructions = json['instructions'];
    //ingredients = json['ingredients'];
  }

}