import 'dart:convert';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
 final url = Uri.parse('https://books-api7.p.rapidapi.com/books/find/genres');
  final headers = {
    "X-RapidAPI-Key": "719c019a9dmsh6587aebd9482e98p1bb03fjsn8985324d6045",
    "X-RapidAPI-Host": "books-api7.p.rapidapi.com"
  };
  final queryParameters = {
    "genres[]":["fantasy","fantasy","Classics"],
  };

  final response = await http.get(url.replace(queryParameters: queryParameters), headers: headers);

  List<dynamic> array = json.decode(response.body);
    List _temp = [];

    for (var i in array) {

      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}