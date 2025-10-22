import 'package:flutter/material.dart';

void main() {
  runApp(const FikriApp());
}

class DrinkItem {
  final String name;
  const DrinkItem(this.name);
}

const List<DrinkItem> drinkMenu = [
  DrinkItem('Es Teh Manis'),
  DrinkItem('Es Jeruk Peras'),
  DrinkItem('Kopi Hitam Dingin'),
  DrinkItem('Air Mineral'),
  DrinkItem('Susu Hangat'),
];

class FikriApp extends StatelessWidget {
  const FikriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhamad Fikri Ramadhan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2196F3), // Biru utama
          foregroundColor: Colors.white,
        ),
      ),
      home: const FikriScreen(),
    );
  }
}

class FikriScreen extends StatelessWidget {
  const FikriScreen({super.key});

  void _handleItemTap(BuildContext context, String itemName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil menambahkan $itemName ke dalam keranjang'),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muhamad Fikri Ramadhan'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFBBDEFB), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: drinkMenu.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = drinkMenu[index];
            return InkWell(
              onTap: () => _handleItemTap(context, item.name),
              borderRadius: BorderRadius.circular(12),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shadowColor: Colors.blue.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      const Icon(Icons.local_drink,
                          color: Colors.blueAccent, size: 28),
                      const SizedBox(width: 16),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
