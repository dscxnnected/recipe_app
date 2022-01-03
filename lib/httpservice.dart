import 'dart:convert';
import 'dart:io';
import 'package:recipe_app/recipe.dart';
import 'package:http/http.dart' as http;

class HttpService {

  //List<Recipe> _recipes = List.empty();

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(
      Uri.parse('https://raw.githubusercontent.com/dscxnnected/recipe-list/main/recipe.json'),
      headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.accessControlAllowHeadersHeader: "*",
        HttpHeaders.authorizationHeader: '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',
      },
    );

    print(response.body);
    var recipes = <Recipe>[];

    if (response.statusCode == 200) {
      /*List<dynamic> responseJson = jsonDecode(response.body);

    List<Recipe> recipes = responseJson.map((dynamic item) => Recipe.fromJson(item)).toList();

    return recipes;*/

      var responseJson = jsonDecode(response.body);
      for (var recipeJson in responseJson) {
        print(Recipe.fromJson(recipeJson));
        recipes.add(Recipe.fromJson(recipeJson));
      }

    }

    return recipes;
    //return Recipe.fromJson(responseJson);
  }
}