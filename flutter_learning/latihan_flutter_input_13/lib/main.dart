import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String _nama = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('p13 Input - M.Fikri Ramadhan'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Nama tidak boleh kosong';
                  return null;
                },
                onSaved: (value) => _nama = value!,
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Email tidak boleh kosong';
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("Nama: $_nama, Email: $_email");
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
