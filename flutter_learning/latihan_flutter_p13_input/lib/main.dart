import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 1. Fixed the formKey declaration name consistency
  final _formKey = GlobalKey<FormState>();
  String nim = '';
  String nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 2. Used const for better performance
        title: const Text('p13 Input - M.Fikri Ramadhan'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 3. Moved the validator property inside the TextFormField widget
              TextFormField(
                decoration: const InputDecoration(labelText: 'NIM'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  // 4. Update the state variable 'nim' on success
                  nim = value;
                  return null;
                },
              ),
              const SizedBox(height: 20), // Added spacing between fields
              // 5. Corrected missing closing parenthesis for InputDecoration
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  // 4. Update the state variable 'nama' on success
                  nama = value;
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 6. Corrected the variable name: 'formKey' -> '_formKey'
          // 7. Corrected the property name: 'currentSatate' -> 'currentState'
          if (_formKey.currentState!.validate()) {
            // Success: Form is valid and data is updated in 'nim' and 'nama'
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$nim - $nama Berhasil ditambahkan')),
            );
          }
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.save),
      ),
    );
  }
}
