import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('pData Mahasiswa Fikri'),
          backgroundColor: Colors.lightBlue,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(),
      ), // 3. The closing parenthesis for Scaffold was missing.
    );
  }
}
