import 'package:flutter/material.dart';
import 'package:news/componants/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  var categories = CategoryModel.getCategories();
  Function onCategoryClicked;

  CategoriesScreen(this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                onCategoryClicked(categories[index]);
              },
              child: CategoryItem(categories[index], index));
        },
      ),
    );
  }
}
