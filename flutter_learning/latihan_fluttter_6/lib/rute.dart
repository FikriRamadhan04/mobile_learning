import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  const Rute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigasi - M. Fikri Ramadhan'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Image.asset('images/gambar_1.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
