import 'package:flutter/material.dart';
import 'package:status_management_list/app/shared/widgets/drawer/drawer.dart';
import 'package:status_management_list/app/controllers/categories/categories_controller.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  late final CategoriesController _categoryController;
  final _idCategoryTaskController = TextEditingController();
  final _categoryDescriptionController = TextEditingController();

  @override
  void dispose() {
    _categoryDescriptionController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _categoryController = CategoriesController();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      int idCategoryTask = int.parse(_idCategoryTaskController.text);
      String categoryDescription = _categoryDescriptionController.text;

      _categoryController.addCategories(
        idCategoryTask,
        categoryDescription,
      );
      _categoryController.update();

      // Clear text fields
      _idCategoryTaskController.clear();
      _categoryDescriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Task Category',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: const CustonDrawer(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 40.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _categoryDescriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'Description',
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                    ),
                    onPressed: _submitForm,
                    child: const Text(
                      'Save',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
