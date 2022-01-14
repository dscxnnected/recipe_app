import 'package:flutter/material.dart';
import 'package:recipe_app/recipefields.dart';

class Recipe {
  int? id;
  String name = '';
  String description = '';
  bool isVegan = false;
  bool isVegetarian = false;
  int servings = 0;
  int cookTime = 0;
  int prepTime = 0;
  List<String> ingredients = <String>[];
  List<String> instructions = <String>[];

  Recipe({
    this.id,
    required this.name,
    required this.description,
    required this.isVegan,
    required this.isVegetarian,
    required this.servings,
    required this.cookTime,
    required this.prepTime,
    required this.ingredients,
    required this.instructions
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    servings = json['servings'];
    cookTime = json['cookTime'];
    prepTime = json['prepTime'];

    var ingredList = json['ingredients'] as List;
    for (var ingredString in ingredList) {
      ingredients.add(ingredString);
    }

    var instrList = json['instructions'] as List;
    for (var instrString in instrList) {
      instructions.add(instrString);
    }
  }

  String listToString(List<String> listStr) {
    return listStr.toString();
  }

  Map<String, dynamic> toJson() => {
    RecipeFields.id: id,
    RecipeFields.name: name,
    RecipeFields.description: description,
    RecipeFields.isVegan: isVegan,
    RecipeFields.isVegetarian: isVegetarian,
    RecipeFields.servings: servings,
    RecipeFields.cookTime: cookTime,
    RecipeFields.prepTime: prepTime,
    RecipeFields.ingredients: listToString(ingredients),
    RecipeFields.instructions: listToString(instructions),
  };

}