import 'package:flutter/material.dart';

class RecipeFields {
  static final String id = 'id';
  static final String name = 'name';
  static final String description = 'description';
  static final String isVegan = 'isVegan';
  static final String isVegetarian = 'isVegetarian';
  static final String servings = 'servings';
  static final String cookTime = 'cookTime';
  static final String prepTime = 'prepTime';
  static final String ingredients = 'ingredients';
  static final String instructions = 'instructions';

  static List<String> getFields() => [id, name, description, isVegan, isVegetarian, servings, cookTime, prepTime, ingredients, instructions];
}