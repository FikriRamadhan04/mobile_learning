import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('p11_Tab_View'),
            backgroundColor: Colors.cyan,
            bottom: TabBar(tabs: [Text('home'), Text('chat'), Text('status')]),
          ),
          body: TabBarView(
            children: [Icon(Icons.home), Icon(Icons.chat), Icon(Icons.person)],
          ),
        ),
      ),
    );
  }
}
