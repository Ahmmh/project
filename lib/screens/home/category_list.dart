import 'package:flutter/material.dart';
import 'package:larak_app/models/category_model/category.dart';
import 'package:larak_app/models/category_model/category_service.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
        final categoryService = CategoryService();
    final List<CategoryModel> categoryList = categoryService.getAllCategories();

    final List<CategoryModel> category = categoryList;
    return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: category.map((currentCategory) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print('${currentCategory.name} pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFFEF774C),
                            disabledForegroundColor:
                                const Color(0xFFEF774C).withOpacity(0.38),
                            disabledBackgroundColor:
                                const Color(0xFFEF774C).withOpacity(0.12),
                          ),
                          child: Text(currentCategory.name), // <-- Use the correct variable here
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
  }
}