import 'package:flutter/material.dart';
import 'sub_category_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  final List<String> categories = const [
    "Fictions",
    "Literatures",
    "Detective and Thrillers",
    "History and Politics",
    "Business and Economics",
    "Academic Books",
    "Islamic Books",
    "Admission Preparation",
    "Children & Teen Books",
    "Accessories",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubCategoryPage(
                    categoryName: categories[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}