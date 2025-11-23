import 'package:flutter/material.dart';
import 'package:latihan_flutter_13/mahasiswa.dart';
import 'package:latihan_flutter_13/db_helper.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List<Mahasiswa> _mahasiswaList = [];
  bool _isLoading = true;
  String? _error; 

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
     
      final mhs = await DatabaseHelper().getAllMahasiswa();

    
      setState(() {
        _mahasiswaList = mhs;
        _isLoading = false;
        _error = null; 
      });
    } catch (e) {
     
      print('Error loading data: $e');
      setState(() {
        _isLoading = false;
        _error = 'Gagal memuat data dari database.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    if (_isLoading) {
      bodyContent = const Center(child: CircularProgressIndicator());
    } else if (_error != null) {
     
      bodyContent = Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Error: $_error',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (_mahasiswaList.isEmpty) {
   
      bodyContent = const Center(child: Text('Tidak ada data mahasiswa.'));
    } else {
   
      bodyContent = ListView.builder(
        itemCount: _mahasiswaList.length,
        itemBuilder: (context, index) {
          final mahasiswa = _mahasiswaList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink.shade100,
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.pink),
              ),
            ),
            title: Text(mahasiswa.nama),
            subtitle: Text('NIM: ${mahasiswa.nim}'),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        backgroundColor: Colors.pink,
        actions: [
         
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true; 
              });
              loadData();
            },
          ),
        ],
      ),
      body: bodyContent,
    );
  }
}
