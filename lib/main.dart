import 'package:flutter/material.dart';

import 'package:toboapp/screen/home_menu.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter Produk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Baris ini sudah benar dan akan berfungsi setelah import diperbaiki
      home: const ProductButtonsPage(title: 'Menu Produk'),
    );
  }
}