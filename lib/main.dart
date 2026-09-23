import 'package:flutter/material.dart';

import 'ui/pages/messycatalog_screen.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messy Catalog',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      
      home: const MessyCatalogScreen(),
    );
  }
}