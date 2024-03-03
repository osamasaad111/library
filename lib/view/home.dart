import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe.api.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:flutter_application_1/view/widgets/Bookcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                color: Colors.white,
                ),
              SizedBox(width: 10),
              Text(
                'library Book',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),

            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return card(
                      title: _recipes[index].name,
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}