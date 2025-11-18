import 'package:flutter/material.dart';
import 'package:barcelona_football_mobile/widgets/left_drawer.dart';
import 'package:barcelona_football_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Davin Muhammad Hijran";
  final String npm = "2406365244";
  final String kelas = "KKI";

  // Updated ItemHomepage model for menu buttons
  final List<ItemHomepage> items = [
    ItemHomepage("All Product", Icons.storefront, Colors.blueAccent),
    ItemHomepage("My Product", Icons.inventory_2, Colors.orangeAccent),
    ItemHomepage("Create Product", Icons.add_box, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        title: const Text(
          'Barcelona Football Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF004D98), // Barça blue
        elevation: 4,
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -------------------- INFO CARDS --------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Welcome to Barcelona Football Store',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF004D98),
              ),
            ),

            const SizedBox(height: 16),

            /// -------------------- GRID MENU --------------------
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              // FIXED → use object fields instead of item['title']
              children: items.map((item) {
                return GestureDetector(
                  onTap: () {
                    // You can navigate to pages based on menu name here
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item.icon, size: 40, color: Colors.white),
                        const SizedBox(height: 8),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
///                           INFO CARD
///////////////////////////////////////////////////////////////////////////////

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFDBA111), // Barça gold
      elevation: 5,
      shadowColor: const Color(0xFFA50044),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D98),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
///                           ITEM HOMEPAGE MODEL
///////////////////////////////////////////////////////////////////////////////

class ItemHomepage {
  final String title;
  final IconData icon;
  final Color color;

  ItemHomepage(this.title, this.icon, this.color);
}
