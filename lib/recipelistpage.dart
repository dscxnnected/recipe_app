import 'package:flutter/material.dart';
import 'package:recipe_app/httpservice.dart';
import 'package:recipe_app/recipe.dart';

class RecipeListPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      body: FutureBuilder(
        future: httpService.fetchRecipes(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            List<Recipe>? rec = snapshot.data;

            return ListView(
              children: rec!.map((Recipe recipe) => ListTile(
                title: Text(recipe.name.toString()),
              )).toList(),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}