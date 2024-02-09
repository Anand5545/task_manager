import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/controller/home_screen_controller.dart';
import 'package:task_manager/utils/color_constants.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog(
      {super.key,
      required this.categoryController,
      required this.catController,
      required this.fetchdata});

  final TextEditingController categoryController;
  final CategoryContorller catController;
  final void Function() fetchdata;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Category"),
      content: TextField(
        controller: categoryController,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: "category",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(color: ColorConstants.primaryColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              )),
          isDense: false,
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
      actions: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorConstants.primaryColor)),
            onPressed: () {
              categoryController.clear();
              Navigator.pop(context);
            },
            child: const Text("Close"),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(ColorConstants.primaryColor)),
          onPressed: () {
            catController.addUserCategory(categoryController.text);
            categoryController.clear();
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Category Added successfully")));

            fetchdata();
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}
