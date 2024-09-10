
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'salad', 
        iconPath: 'assets/icons/salad-svgrepo-com.svg', 
        boxColor: Colors.lightBlueAccent,
        )
    );

    categories.add(
      CategoryModel(
        name: 'pancakes', 
        iconPath: 'assets/icons/pancakes-svgrepo-com.svg', 
        boxColor: Colors.green.shade200,
        )
    );

    categories.add(
      CategoryModel(
        name: 'pie', 
        iconPath: 'assets/icons/pie-food-and-restaurant-svgrepo-com.svg', 
        boxColor: const Color.fromARGB(255, 214, 224, 159),
        )
    );

    categories.add(
      CategoryModel(
        name: 'smoothies', 
        iconPath: 'assets/icons/juice-svgrepo-com.svg', 
        boxColor: const Color.fromARGB(255, 177, 108, 154),
        )
    );

    return categories;
  }
}