import 'package:flutter/material.dart';
import 'product_model.dart';
import 'product_details_page.dart';
import 'book_data.dart';

class ProductListPage extends StatelessWidget {
  final String sectionName;

  const ProductListPage({
    super.key,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> products =
        bookDatabase[sectionName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(sectionName),
        centerTitle: true,
      ),
      body: products.isEmpty
          ? const Center(
        child: Text(
          "No books available in this section.",
          style: TextStyle(fontSize: 16),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsPage(product: product),
                ),
              );
            },
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(10),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  product.author,
                  style: const TextStyle(
                      color: Colors.grey),
                ),
                Text(
                  "৳${product.price}",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}