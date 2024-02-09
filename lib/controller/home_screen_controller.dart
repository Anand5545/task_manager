import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager/view/widgets/add_catagory.dart';

class CategoryContorller {
  final CatBox = Hive.box('catagories');
  final noteBox = Hive.box('notebox');

  void initalizeApp() async {
    //List default categories
    List<String> defaultCategories = ['work', 'personal', 'ideas'];

    //check if categories already exist

    bool categoriesExist = CatBox.isNotEmpty;

    //if default categories dont exist ,add them

    if (!categoriesExist) {
      for (String categoryName in defaultCategories) {
        CatBox.add(categoryName);
      }
    }
  }

  void addUserCategory(String categoryName) {
    CatBox.add(categoryName);
  }

  AddCategory({
    required BuildContext context,
    required TextEditingController categorycontroller,
    required CategoryContorller catController,
    required void Function() fetchdata,
  }) {
    return showDialog(
        context: context,
        builder: (context) => AddCategoryDialog(
            categoryController: categorycontroller,
            catController: catController,
            fetchdata: fetchdata));
  }
}
