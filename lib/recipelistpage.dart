import 'package:flutter/material.dart';
import 'package:recipe_app/addrecipepage.dart';
import 'package:recipe_app/httpservice.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipedetailpage.dart';
import 'package:recipe_app/recipesheetsapi.dart';

class RecipeListPage extends StatelessWidget {
  //final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        //TODO remove this from app bar
        actions: [
          FloatingActionButton(
            heroTag: "add",
            child: Icon(Icons.add),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddRecipePage())
          )),
          FloatingActionButton(
              heroTag: "refresh",
              child: Icon(Icons.refresh),
              //TODO add refresh functionality here - may require conversion to stateful widget? could potentially call rebuild on .pop()
              onPressed: () => print(RecipeSheetsApi.fetchRecipes())
          ),
        ],
      ),
      body: FutureBuilder(
        future: RecipeSheetsApi.fetchRecipes(),
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