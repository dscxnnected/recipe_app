import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({required this.recipe, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                /*ListTile(
                  title: Text("Name"),
                  subtitle: Text(recipe.name.toString()),
                ),*/
                ListTile(
                  title: Text("Description"),
                  subtitle: Text(recipe.description.toString()),
                ),
                ListTile(
                  title: Text("Number of Servings"),
                  subtitle: Text(recipe.servings.toString()),
                ),
                ListTile(
                  title: Text("Is Vegan?"),
                  subtitle: Text(recipe.isVegan.toString().toUpperCase()),
                ),
                ListTile(
                  title: Text("Is Vegetarian?"),
                  subtitle: Text(recipe.isVegetarian.toString().toUpperCase()),
                ),
                ListTile(
                  title: Text("Prepping Time"),
                  subtitle: Text(recipe.prepTime.toString() + " Minutes"),
                ),
                ListTile(
                  title: Text("Cooking Time"),
                  subtitle: Text(recipe.cookTime.toString() + " Minutes"),
                ),

                ListTile(
                  title: Text("Ingredients")
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (context, int index){
                    return ListTile(
                      subtitle: Text(recipe.ingredients[index].toString()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Instructions")
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipe.instructions.length,
                  itemBuilder: (context, int index){
                    return ListTile(
                      subtitle: Text(recipe.instructions[index].toString()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}