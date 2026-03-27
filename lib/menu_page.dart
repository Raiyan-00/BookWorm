import 'package:flutter/material.dart';
import 'login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [

          Container(
            height: 180,
            color: const Color(0xFFFF8C42), // Orange-ish color
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFFFF8C42),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text("Login / Register"),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          buildMenuItem(Icons.category, "Subjects"),
          buildMenuItem(Icons.edit, "Authors"),
          buildMenuItem(Icons.business, "Publishers"),
          buildMenuItem(Icons.local_offer, "Offers"),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          buildMenuItem(Icons.phone, "Contact Us"),
          buildMenuItem(Icons.info, "About Us"),
          buildMenuItem(Icons.share, "Share App"),
          buildMenuItem(Icons.star, "Rate & Review"),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  static Widget buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}