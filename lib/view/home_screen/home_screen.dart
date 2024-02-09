import 'package:flutter/material.dart';
import 'package:task_manager/utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      floatingActionButton: FloatingActionButton(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 2, color: Colors.white)),
        elevation: 0,
        onPressed: () => bottomSheet(context),
        backgroundColor: ColorConstants.secondaryColor1,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context,
      {var key, int? indexOfEditing, int? currentCategory}) {
    return showModalBottomSheet(
        backgroundColor: ColorConstants.primaryBackgroundColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, InsetState) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      labelText: "Title",
                                      labelStyle: TextStyle(
                                          color: ColorConstants.primaryColor,
                                          fontWeight: FontWeight.w500),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstants.primaryColor,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: ColorConstants.primaryColor,
                                          )),
                                      isDense: false,
                                      // Added this
                                      contentPadding: const EdgeInsets.all(20),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter the Title';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 150,
                                    child: TextFormField(
                                      controller: descriptionController,
                                      maxLines: null,
                                      expands: true,
                                      textAlignVertical: TextAlignVertical.top,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorConstants.primaryColor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: "Description",
                                        hintStyle: TextStyle(
                                            color: ColorConstants.primaryColor),

                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color:
                                                  ColorConstants.primaryColor,
                                            )),
                                        isDense: false,
                                        // Added this
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter description';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Category",
                                    style: TextStyle(
                                        color: ColorConstants.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ])))))));
  }
}
