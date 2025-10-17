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
        title: const Text('Navigasi - M. Fikri Ramadhan'),
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat Datang di Aplikasi M. Fikri Ramadhan'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Pelajari'),
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
