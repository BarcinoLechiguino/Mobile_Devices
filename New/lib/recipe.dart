class Ingredient
{
  String name;
  double amount;
  String units;

  Ingredient(this.name, this.amount, this.units);
  Ingredient.fromJson(Map<String, dynamic> json) 
  {
    this.name = json['name'];
    this.amount = json['amount'];
    this.units = json['units'];
  }
}

class Recipe
{
  String title;
  Duration minutes;
  List<Ingredient> ingredients;

  Recipe(this.title, this.minutes, this.ingredients);
  Recipe.fromJson(Map<String, dynamic> json)
  {
    this.title = json['title'];
    this.minutes = json['minutes'];
    this.ingredients = json['ingredients'].map((ingrJson) =>Ingredient.fromJson(ingrJson)).toList();
  }
}