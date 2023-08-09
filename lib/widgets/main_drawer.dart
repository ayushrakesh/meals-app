import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function selectDrawer) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: selectDrawer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 16,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto-Condensed-Regular',
                fontSize: 30,
                letterSpacing: 1.1,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(
                FiltersScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
