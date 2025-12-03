import 'package:flutter/material.dart';
import 'package:latihan_flutter_p13_input/db_helper.dart';
import 'package:latihan_flutter_p13_input/mahasiswa.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List<Mahasiswa> data_mhs = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final mhs = await DatabaseHelper().getAllMahasiswa();
    setState(() {
      data_mhs = mhs;
    });
  }

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
        body: ListView.builder(
          itemCount: data_mhs.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data_mhs[index].nama),
              subtitle: Text(data_mhs[index].nim),
            );
          },
        ),
      ),
    );
  }
}
