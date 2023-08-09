import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favouites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/';

  List<Meal> favouritedMeals;

  TabScreen(this.favouritedMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;

  List<Map<String, Object>> items;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    items = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(widget.favouritedMeals),
        'title': 'Your Favourite'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          items[selectedPageIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: items[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedLabelStyle: TextStyle(
          letterSpacing: 1.2,
        ),
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 220, 8, 79),
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourites',
          ),
        ],
        currentIndex: selectedPageIndex,
        selectedItemColor: Color.fromARGB(255, 232, 249, 144),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
