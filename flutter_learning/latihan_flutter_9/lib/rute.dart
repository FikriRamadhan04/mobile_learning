import 'package:flutter/material.dart';

class Rute extends StatelessWidget {
  const Rute({super.key});

    @override
      Widget build(BuildContext context) {
          return Scaffold(
                appBar: AppBar(
                        title: const Text('Route - Febrio S.R Siburian'),
                                backgroundColor: Colors.red,
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
                                                                                                    