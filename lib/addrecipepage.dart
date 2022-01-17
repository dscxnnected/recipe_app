import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipefields.dart';
import 'package:recipe_app/recipesheetsapi.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'httpservice.dart';

class AddRecipePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddRecipePageState();
  }
}

class AddRecipePageState extends State<AddRecipePage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Recipe recipe = Recipe(
      name: "",
      description: "",
      isVegan: false,
      isVegetarian: false,
      servings: 0,
      cookTime: 0,
      prepTime: 0,
      ingredients: [],
      instructions: []);

  @override
  void initState() {
    super.initState();
    recipe.ingredients = List<String>.empty(growable: true);
    recipe.instructions = List<String>.empty(growable: true);
    recipe.ingredients.add("");
    recipe.instructions.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: _uiForm(),
    );
  }

  Widget _uiForm() {
    List<dynamic> booleanTypeList = [];
    booleanTypeList.add({"id": true, "name": "True"});
    booleanTypeList.add({"id": false, "name": "False"});
    return Form(
        key: _formState,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "name",
                  "Name",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Name can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    recipe.name = onSavedVal;
                  },
                  initialValue: recipe.name ?? "",
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  fontSize: 14,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                ),
                FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "description",
                  "Description",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Description can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    recipe.description = onSavedVal;
                  },
                  initialValue: recipe.description ?? "",
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  fontSize: 14,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                ),
                FormHelper.dropDownWidgetWithLabel(
                  context,
                  "Is Vegan?",
                  "",
                  "",
                  booleanTypeList,
                  (onChangedVal) {
                    bool chngVal =
                        onChangedVal.toString().toLowerCase() == 'true';

                    recipe.isVegan = chngVal;
                  },
                  (onValidateVal) {
                    if (onValidateVal == null) {
                      return "Please select a value";
                    }
                    return null;
                  },
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                ),
                FormHelper.dropDownWidgetWithLabel(
                  context,
                  "Is Vegetarian?",
                  "",
                  "",
                  booleanTypeList,
                  (onChangedVal) {
                    bool chngVal =
                        onChangedVal.toString().toLowerCase() == 'true';

                    recipe.isVegetarian = chngVal;
                  },
                  (onValidateVal) {
                    if (onValidateVal == null) {
                      return "Please select a value";
                    }
                    return null;
                  },
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                ),
                FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "servings",
                  "Serving Size",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Serving Size can't be empty";
                    } else if (int.tryParse(onValidateVal!) != null) {
                      return null;
                    } else {
                      return "Please enter a valid number";
                    }
                  },
                  (onSavedVal) {
                    recipe.servings = int.tryParse(onSavedVal)!;
                  },
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  fontSize: 14,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                ),
                FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "cooktime",
                  "Cooking Time (in minutes)",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Cooking Time can't be empty";
                    } else if (int.tryParse(onValidateVal!) != null) {
                      return null;
                    } else {
                      return "Please enter a valid number";
                    }
                  },
                  (onSavedVal) {
                    recipe.cookTime = int.tryParse(onSavedVal)!;
                  },
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  fontSize: 14,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                ),
                FormHelper.inputFieldWidgetWithLabel(
                  context,
                  Icon(Icons.web),
                  "preptime",
                  "Prep Time (in minutes)",
                  "",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Prep Time can't be empty";
                    } else if (int.tryParse(onValidateVal!) != null) {
                      return null;
                    } else {
                      return "Please enter a valid number";
                    }
                  },
                  (onSavedVal) {
                    recipe.prepTime = int.tryParse(onSavedVal)!;
                  },
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  fontSize: 14,
                  labelFontSize: 14,
                  paddingLeft: 0,
                  paddingRight: 0,
                  showPrefixIcon: false,
                ),
                _ingredientsContainer(),
                _instructionsContainer(),
                Center(
                  child: FormHelper.submitButton("Save", () async {
                    if (validateAndSave()) {
                      final id = await RecipeSheetsApi.getRowCount() + 1;
                      recipe.id = id;
                      RecipeSheetsApi.insert([recipe.toJson()]);
                      Navigator.of(context).pop();
                    }
                  }),
                )
              ],
            ),
          ),
        ));
  }

  Widget _ingredientsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Ingredient(s)",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [ingredientUI(index)],
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: recipe.ingredients.length),
      ],
    );
  }

  Widget ingredientUI(index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.web),
              "ingredient_$index",
              "",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Ingredient ${index + 1} can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                recipe.ingredients[index] = onSavedVal;
              },
              borderColor: Colors.redAccent,
              borderFocusColor: Colors.redAccent,
              borderRadius: 2,
              fontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              showPrefixIcon: false,
            ),
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  addIngredientControl();
                },
              ),
            ),
            visible: index == recipe.ingredients.length - 1,
          ),
          Visibility(
              child: SizedBox(
                width: 35,
                child: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    removeIngredientControl(index);
                  },
                ),
              ),
              visible: index > 0)
        ],
      ),
    );
  }

  Widget _instructionsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Instructions(s)",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [instructionUI(index)],
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: recipe.instructions.length),
      ],
    );
  }

  Widget instructionUI(index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.web),
              "instruction_$index",
              "",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Instruction ${index + 1} can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                recipe.instructions[index] = onSavedVal;
              },
              borderColor: Colors.redAccent,
              borderFocusColor: Colors.redAccent,
              borderRadius: 2,
              fontSize: 14,
              paddingLeft: 0,
              paddingRight: 0,
              showPrefixIcon: false,
            ),
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  addInstructionControl();
                },
              ),
            ),
            visible: index == recipe.instructions.length - 1,
          ),
          Visibility(
              child: SizedBox(
                width: 35,
                child: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    removeInstructionControl(index);
                  },
                ),
              ),
              visible: index > 0)
        ],
      ),
    );
  }

  void addIngredientControl() {
    setState(() {
      recipe.ingredients.add("");
    });
  }

  void removeIngredientControl(index) {
    setState(() {
      if (recipe.ingredients.length > 1) {
        recipe.ingredients.removeAt(index);
      }
    });
  }

  void addInstructionControl() {
    setState(() {
      recipe.instructions.add("");
    });
  }

  void removeInstructionControl(index) {
    setState(() {
      if (recipe.instructions.length > 1) {
        recipe.instructions.removeAt(index);
      }
    });
  }

  bool validateAndSave() {
    final form = _formState.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
