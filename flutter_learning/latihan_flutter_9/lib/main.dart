import 'package:flutter/material.dart';
import 'rute.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Febrio S.R Siburian - 231091750154'),
        backgroundColor: Colors.red,
        leading: const Icon(Icons.alarm),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat Datang di Aplikasi Febrio S.R Siburian'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('menuju ke Route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
