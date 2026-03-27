import 'package:flutter/material.dart';
import 'cart_manager.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {

    final cartItems = CartManager.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart (${cartItems.length} items)"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                CartManager.clearCart();
              });
            },
            child: const Text(
              "Clear All",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 60,
                              child: Image.asset(
                                item.product.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.title,
                                    style: const TextStyle(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  Text(
                                    "৳${item.product.price}",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  CartManager.removeFromCart(
                                      item.product);
                                });
                              },
                            )
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            Text(
                              "৳${item.totalPrice.toStringAsFixed(0)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ORDER SUMMARY
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                _summaryRow("Subtotal", CartManager.subtotal),
                _summaryRow("Shipping", CartManager.shipping),
                const Divider(),
                _summaryRow(
                    "Total", CartManager.total,
                    isTotal: true),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize:
                    const Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Proceed to Checkout ৳${CartManager.total.toStringAsFixed(0)}",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _summaryRow(String title, double value,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            "৳${value.toStringAsFixed(0)}",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}