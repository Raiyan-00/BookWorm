import 'package:flutter/material.dart';
import 'product_list_page.dart';

class SubCategoryPage extends StatelessWidget {
  final String categoryName;

  const SubCategoryPage({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> subCategories =
    _generateDummySubCategories(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(
              subCategories[index],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListPage(
                    sectionName: subCategories[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // 🔥 Dummy Data Generator
  List<String> _generateDummySubCategories(String category) {
    switch (category) {
      case "Academic Books":
        return [
          "University",
          "Engineering",
          "HSC (Class 11-12)",
          "Diploma",
          "Madrasa",
          "Medical",
          "School",
        ];

      case "Fictions":
        return [
          "Romance",
          "Science Fiction",
          "Fantasy",
          "Horror",
          "Drama",
        ];

      case "Detective and Thrillers":
        return [
          "Crime & Mystery",
          "Psychological Thrillers",
          "Spy Thrillers",
        ];

      case "Islamic Books":
        return [
          "Quran",
          "Hadith",
          "Fiqh",
          "Islamic History",
        ];

      case "Admission Preparation":
        return [
          "Medical Admission",
          "Engineering Admission",
          "University Admission",
        ];

      case "Business and Economics":
        return [
          "Marketing",
          "Finance",
          "Entrepreneurship",
          "Management",
        ];

      case "History and Politics":
        return [
          "World History",
          "Bangladesh History",
          "Political Science",
          "Biographies",
        ];

      case "Children & Teen Books":
        return [
          "Story Books",
          "Comics",
          "Educational",
          "Teen Fiction",
        ];

      case "Accessories":
        return [
          "Bookmarks",
          "Book Lights",
          "Notebooks",
          "Stationery",
        ];

      default:
        return [
          "Popular",
          "New Arrivals",
          "Best Sellers",
          "Editor's Choice",
        ];
    }
  }
}