import 'package:flutter/material.dart';
import 'package:latihan_flutter_p13_input/mahasiswa.dart';
import 'data.dart';
import 'db_helper.dart'; // Ganti dengan path yang benar

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  String nim = '';
  String nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('p13 Input - M.Fikri Ramadhan'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'NIM'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  nim = value;
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }

                  nama = value;
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            //disini perintah save
            final mahasiswa = Mahasiswa(nim: nim, nama: nama);
            await DatabaseHelper().insertMahasiswa(mahasiswa);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Data()),
            );
          }
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.save),
      ),
    );
  }
}
