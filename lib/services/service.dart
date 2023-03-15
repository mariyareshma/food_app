import 'package:dio/dio.dart';
import 'package:food_app/model/recipes.dart';

var dio = Dio();
Future<RandomRecipe?> getRandomRecipe() async {
  var response = await dio.get('https://low-carb-recipes.p.rapidapi.com/random',
      options: Options(headers: {
        'X-RapidAPI-Key': 'ad9b6066b1mshd5756570e550bb8p160398jsndfd6aec09495',
        'X-RapidAPI-Host': 'low-carb-recipes.p.rapidapi.com'
      }));
  if (response.statusCode == 200) {
    var foodJsons = response.data;
    var foodRecipeObj = RandomRecipe.fromJson(foodJsons);
    return foodRecipeObj;
  }
  return null;
}
