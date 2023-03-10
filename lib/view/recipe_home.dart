import 'package:flutter/material.dart';
import 'package:food_app/view/favorite_page.dart';
import 'package:food_app/view/recipe_page.dart';
import 'package:food_app/view/search_page.dart';

class RecipeHome extends StatefulWidget {
  const RecipeHome({Key? key}) : super(key: key);

  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Recipe Book')),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.food_bank),
                label: 'Recipe Page',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite Page'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
            ],
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.green,
            selectedItemColor: Colors.red,
            onTap: ((value) => setState(() {
                  selectedIndex = value;
                }))),
        body: getSelected());
  }

  Widget getSelected() {
    switch (selectedIndex) {
      case 0:
        return const RandomRecipePage();
      case 1:
        return const FavoritePage();
      case 2:
        return const SearchPage();
    }
    return const RandomRecipePage();
  }
}
