import 'package:flutter/material.dart';
import 'package:recipe_app/addrecipepage.dart';
import 'package:recipe_app/httpservice.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipedetailpage.dart';

class RecipeListPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        //TODO remove this from app bar
        actions: [
          FloatingActionButton(
            child: Icon(Icons.add),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddRecipePage())
          ))
        ],
      ),
      body: FutureBuilder(
        future: httpService.fetchRecipes(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            List<Recipe>? rec = snapshot.data;

            return ListView(
                  children: rec!.map(
                          (Recipe recipe) => ListTile(
                            title: Text(recipe.name.toString()),
                            subtitle: Text(recipe.description.toString()),
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RecipeDetailPage(
                                    recipe: recipe
                                )
                            )),
                          )
                  ).toList(),
                );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}