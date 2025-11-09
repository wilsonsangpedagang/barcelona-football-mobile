import 'package:flutter/material.dart';
import 'package:barcelona_football_mobile/screens/menu.dart';
import 'package:barcelona_football_mobile/screens/product_form.dart'; // You can adjust this name later

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // 🔵 Drawer header section (Barcelona theme)
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFA50044), Color(0xFF004D98)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Barcelona Football Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFED02), // gold-yellow accent
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Find your favorite Barça merchandise here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // 🏠 Home
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Color(0xFF004D98)),
            title: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // ➕ Add Product
          ListTile(
            leading: const Icon(Icons.add_box_outlined, color: Color(0xFFA50044)),
            title: const Text(
              'Add Product',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(), // Change name if needed
                ),
              );
            },
          ),

          // 🛒 Product List
          ListTile(
            leading: const Icon(Icons.list_alt, color: Color(0xFFEDBB00)),
            title: const Text(
              'Product List',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Temporary alert until the page is implemented
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xFFA50044),
                    content: Text(
                      'Feature coming soon: Product List Page!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}
