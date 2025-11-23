// main.dart

import 'package:flutter/material.dart';
import 'package:latihan_flutter_13/mahasiswa.dart';
import 'package:latihan_flutter_13/db_helper.dart';
// import 'package:latihan_flutter_13/input_mahasiswa_page.dart'; // Ganti Placeholder dengan ini

// ⭐️ 1. FUNGSI UTAMA YANG HILANG ⭐️
void main() {
  // Pastikan inisialisasi Firebase jika Anda menggunakan Firestore
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

// ⭐️ 2. WIDGET PEMBUNGKUS UTAMA ⭐️
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // Set DataListView sebagai halaman utama (home)
      home: const DataListView(),
    );
  }
}

// ⭐️ 3. KODE DataListView ANDA (DITEMPATKAN DI SINI) ⭐️

class DataListView extends StatefulWidget {
  const DataListView({super.key});

  @override
  State<DataListView> createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {
  Key _refreshKey = UniqueKey();

  void _refreshData() {
    setState(() {
      _refreshKey = UniqueKey();
    });
  }

  void _navigateToAddData() async {
    final result = await Navigator.push(
      context,
      // 💡 Ganti Placeholder dengan widget input Anda:
      MaterialPageRoute(builder: (context) => const Placeholder()), 
      // Contoh: MaterialPageRoute(builder: (context) => const InputMahasiswaPage()), 
    );
    
    if (result == true) { 
      _refreshData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refreshData),
        ],
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        key: _refreshKey,
        future: DatabaseHelper().getAllMahasiswa(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Gagal memuat data: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data mahasiswa.'));
          }
          
          final List<Mahasiswa> mahasiswaList = snapshot.data!;
          return ListView.builder(
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              final mahasiswa = mahasiswaList[index];
              
              return Dismissible(
                key: Key(mahasiswa.nim),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  await DatabaseHelper().deleteMahasiswa(mahasiswa.nim);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Mahasiswa ${mahasiswa.nama} dihapus.'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  _refreshData();
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink.shade100,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.pink),
                    ),
                  ),
                  title: Text(mahasiswa.nama),
                  subtitle: Text('NIM: ${mahasiswa.nim}'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddData,
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}