import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'book_data.dart';
import 'product_model.dart';
import 'product_details_page.dart';
import 'product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const CategoryPage(),
    const CartPage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF00A2E8),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(
            'assets/images/bookworm.png',
            height: 55,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/Banner.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          ...bookDatabase.keys.map((category) {

            final List<Product> products =
                bookDatabase[category] ?? [];

            if (products.isEmpty) {
              return const SizedBox();
            }

            final List<Product> limitedProducts =
            products.length > 3
                ? products.sublist(0, 3)
                : products;

            return Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductListPage(
                                    sectionName:
                                    category),
                          ),
                        );
                      },
                      child: const Text(
                        "See More",
                        style: TextStyle(
                          color: Color(0xFF00A2E8),
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection:
                    Axis.horizontal,
                    itemCount:
                    limitedProducts.length,
                    itemBuilder:
                        (context, index) {

                      final product =
                      limitedProducts[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailsPage(
                                      product:
                                      product),
                            ),
                          );
                        },
                        child: Container(
                          width: 130,
                          margin:
                          const EdgeInsets.only(
                              right: 10),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [

                              Container(
                                height: 150,
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      10),
                                  color: Colors
                                      .grey
                                      .shade300,
                                ),
                                child:
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      10),
                                  child:
                                  Image.asset(
                                    product.image,
                                    fit: BoxFit
                                        .contain,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                  height: 6),

                              Text(
                                product.title,
                                maxLines: 2,
                                overflow:
                                TextOverflow
                                    .ellipsis,
                                style:
                                const TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                  FontWeight
                                      .w600,
                                ),
                              ),

                              const SizedBox(
                                  height: 4),

                              Text(
                                "৳${product.price.toStringAsFixed(0)}",
                                style:
                                const TextStyle(
                                  color: Color(
                                      0xFF00A2E8),
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}