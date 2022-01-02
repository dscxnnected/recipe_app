class Recipe {
  String? name;
  String? description;
  bool? isVegan;
  bool? isVegetarian;
  int? servings;
  int? cookTime;
  int? prepTime;
  List<String>? instructions;
  List<String>? ingredients;

  Recipe(this.name, this.description, this.isVegan, this.isVegetarian, this.servings, this.cookTime, this.prepTime, this.instructions, this.ingredients);

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    servings = json['servings'];
    cookTime = json['cookTime'];
    prepTime = json['prepTime'];
    instructions = json['instructions'];
    ingredients = json['ingredients'];
  }

}