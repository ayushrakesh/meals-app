import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isMealFavourite;

  MealDetailScreen(this.toggleFavourite, this.isMealFavourite);

  Widget sectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
      ),
      child: Chip(
        backgroundColor: Theme.of(context).primaryColor,
        label: Container(
          // color: ,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.1,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionContent(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 2,
      ),
      height: 150,
      width: 330,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectMeal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            6,
          ),
          child: Column(
            children: [
              Container(
                height: 280,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    6,
                  ),
                  child: Image.network(
                    selectMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sectionTitle(
                context,
                'Ingredients',
              ),
              sectionContent(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Color.fromARGB(255, 253, 215, 227),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Text(
                        selectMeal.ingredients[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  itemCount: selectMeal.ingredients.length,
                ),
              ),
              sectionTitle(
                context,
                'Steps',
              ),
              sectionContent(
                  context,
                  ListView.builder(
                      itemBuilder: (ctx, index) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text('#${index + 1}'),
                                  maxRadius: 20,
                                ),
                                title: Text(
                                  selectMeal.steps[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                      itemCount: selectMeal.steps.length)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavourite(mealId)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
