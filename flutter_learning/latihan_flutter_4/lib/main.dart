import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan, // Menyamakan warna AppBar
          title: const Text('Latihan 4'),
          elevation: 0, // Menghilangkan bayangan agar menyatu
        ),
        body: Column(
          // children akan mengisi ruang Column dari atas ke bawah
          children: [
            // Expanded membuat widget di dalamnya mengisi ruang yang tersedia
            // flex: 2 berarti bagian ini mengambil 2 porsi ruang
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.cyan, // Warna latar belakang container
                child: const Center(
                  child: Text(
                    'Muhamad Fikri ramadhan',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),

            // flex: 5 berarti bagian ini mengambil 5 porsi ruang (lebih besar)
            Expanded(
              flex: 5,
              child: Padding(
                // Memberi jarak di sekeliling area teks
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  // Menyusun kolom agar memiliki jarak yang merata
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kolom 1
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Merah',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Pink',
                          style: TextStyle(color: Colors.pink, fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Hitam',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    // Kolom 2
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kuning',
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Jingga',
                          style: TextStyle(color: Colors.orange, fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Cokelat',
                          style: TextStyle(color: Colors.brown, fontSize: 16),
                        ),
                      ],
                    ),
                    // Kolom 3
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hijau',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Cyan',
                          style: TextStyle(color: Colors.cyan, fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Ungu',
                          style: TextStyle(color: Colors.purple, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
