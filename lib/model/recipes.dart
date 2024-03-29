class RandomRecipes {
  RandomRecipes({
    required this.recipes,
  });

  final List<RandomRecipe> recipes;

  factory RandomRecipes.fromJson(List<dynamic> json) {
    return RandomRecipes(
      recipes: json.map((x) => RandomRecipe.fromJson(x)).toList(),
    );
  }
}

class RandomRecipe {
  RandomRecipe({
    required this.id,
    required this.name,
    required this.tags,
    required this.description,
    required this.prepareTime,
    required this.cookTime,
    required this.ingredients,
    required this.steps,
    required this.servings,
    required this.servingSizes,
    required this.nutrients,
    required this.image,
  });

  final String? id;
  final String? name;
  final List<String> tags;
  final String? description;
  final int? prepareTime;
  final int? cookTime;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final int? servings;
  final List<ServingSizeElement> servingSizes;
  final Map<String, double> nutrients;
  final String? image;

  factory RandomRecipe.fromJson(Map<String, dynamic> json) {
    return RandomRecipe(
      id: json["id"],
      name: json["name"],
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]!.map((x) => x)),
      description: json["description"],
      prepareTime: json["prepareTime"],
      cookTime: json["cookTime"],
      ingredients: json["ingredients"] == null
          ? []
          : List<Ingredient>.from(
              json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
      steps: json["steps"] == null
          ? []
          : List<String>.from(json["steps"]!.map((x) => x)),
      servings: json["servings"],
      servingSizes: json["servingSizes"] == null
          ? []
          : List<ServingSizeElement>.from(
              json["servingSizes"]!.map((x) => ServingSizeElement.fromJson(x))),
      nutrients: Map.from(json["nutrients"])
          .map((k, v) => MapEntry<String, double>(k, v)),
      image: json["image"],
    );
  }
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.servingSize,
  });

  final String? name;
  final IngredientServingSize? servingSize;

  String getQuantity() {
    var ingredientsAmount = '';
    if (servingSize!.grams != null) {
      var grams = servingSize!.grams!.toStringAsFixed(2);

      if (servingSize!.qty != null && servingSize!.units != null) {
        ingredientsAmount =
            '$grams (${servingSize!.qty} ${servingSize!.units})';
      }
    } else {
      if (servingSize!.qty != null && servingSize!.units != null) {
        ingredientsAmount = '${servingSize!.qty} ${servingSize!.units}';
      }
    }

    return ingredientsAmount;
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json["name"],
      servingSize: json["servingSize"] == null
          ? null
          : IngredientServingSize.fromJson(json["servingSize"]),
    );
  }
  Map<String, dynamic> toJson() {
    var ingredient = {'name': name, 'servingSize': servingSize};
    return ingredient;
  }
}

class IngredientServingSize {
  IngredientServingSize({
    required this.units,
    required this.desc,
    required this.qty,
    required this.grams,
    required this.scale,
  });

  final String? units;
  final String? desc;
  final double? qty;
  final int? grams;
  final double? scale;

  factory IngredientServingSize.fromJson(Map<String, dynamic> json) {
    return IngredientServingSize(
      units: json["units"],
      desc: json["desc"],
      qty: json["qty"],
      grams: int.tryParse(json["grams"].toString()),
      scale: json["scale"],
    );
  }

  Map<String, dynamic> toJson() {
    var ingredientServingSize = {
      'unit': units,
      'desc': desc,
      'qty': qty,
      'grams': grams,
      'scale': scale
    };
    return ingredientServingSize;
  }
}

class ServingSizeElement {
  ServingSizeElement({
    required this.scale,
    required this.qty,
    required this.grams,
    required this.units,
    required this.originalWeight,
    required this.originalWeightUnits,
  });

  final int? scale;
  final int? qty;
  final int? grams;
  final String? units;
  final int? originalWeight;
  final String? originalWeightUnits;

  factory ServingSizeElement.fromJson(Map<String, dynamic> json) {
    return ServingSizeElement(
      scale: int.tryParse(json["scale"].toString()),
      qty: int.tryParse(json["qty"].toString()),
      grams: int.tryParse(json["grams"].toString()),
      units: json["units"],
      originalWeight: int.tryParse(json["originalWeight"].toString()),
      originalWeightUnits: json["originalWeightUnits"],
    );
  }
  Map<String, dynamic> toJson() {
    var servingSizeElement = {
      'scale': scale,
      'qty': qty,
      'grams': grams,
      'unit': units,
      'originalWeight': originalWeight,
      'originalUnits': originalWeightUnits,
    };
    return servingSizeElement;
  }
}
