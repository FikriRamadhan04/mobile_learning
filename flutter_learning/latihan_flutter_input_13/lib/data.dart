import 'package:flutter/material.dart';
import 'mahasiswa.dart';
import 'db_helper.dart';

class DataMahasiswaPage extends StatefulWidget {
  const DataMahasiswaPage({super.key});

  @override
  State<DataMahasiswaPage> createState() => _DataMahasiswaPageState();
}

class _DataMahasiswaPageState extends State<DataMahasiswaPage> {
  final DbHelper dbHelper = DbHelper();
  late Future<List<Mahasiswa>> _mahasiswaListFuture;

  @override
  void initState() {
    super.initState();
    _refreshMahasiswaList();
  }

  void _refreshMahasiswaList() {
    setState(() {
      _mahasiswaListFuture = dbHelper.getMahasiswaList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: _mahasiswaListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data mahasiswa.'));
          } else {
            final mahasiswaList = snapshot.data!;
            return ListView.builder(
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final mhs = mahasiswaList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mhs.nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(mhs.nim, style: const TextStyle(fontSize: 16)),
                      const Divider(),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
