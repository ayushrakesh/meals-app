import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool vegan = false;
  bool vegetarian = false;
  bool glutenFree = false;
  bool lactoseFree = false;

  @override
  void initState() {
    vegan = widget.currentFilter['vegan'];
    vegetarian = widget.currentFilter['vegetarian'];
    lactoseFree = widget.currentFilter['lactose-free'];
    glutenFree = widget.currentFilter['gluten-free'];
    super.initState();
  }

  Widget buildSwitchTile(
      bool filterType, String title, Function newValue, String subTitle) {
    return SwitchListTile(
      value: filterType,
      onChanged: newValue,
      title: Text(
        title,
      ),
      subtitle: Text(
        subTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'vegetarian': vegetarian,
                'vegan': vegan,
                'lactose-free': lactoseFree,
                'gluten-free': glutenFree,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              20,
            ),
            child: Text(
              'Adjust your meal selection!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile(
                  vegetarian,
                  'Vegetarian',
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                  'Only include vegetarian meals.',
                ),
                buildSwitchTile(
                  glutenFree,
                  'Gluten-free',
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                  'Only include gluten-free meals.',
                ),
                buildSwitchTile(
                  lactoseFree,
                  'Lactose-free',
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                  'Only include lactose-free meals.',
                ),
                buildSwitchTile(
                  vegan,
                  'Vegan',
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                  'Only include vegan meals.',
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
