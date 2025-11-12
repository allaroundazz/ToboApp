// Lokasi: lib/widgets/left_drawer.dart

import 'package:flutter/material.dart';

import 'package:toboapp/screen/home_menu.dart'; 

import 'package:toboapp/screen/addproduct_form.dart'; 

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Text('Toboapp', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                Padding(padding: EdgeInsets.all(8)),
                Text('Produk toboapp', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          ),
          
          // Opsi Halaman Utama (Persyaratan Dosen)
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pop(context);
              // NAVIGASI: Kembali ke Halaman Utama (ProductButtonsPage)
              Navigator.pushReplacement(
                context, 
                // Ganti MyHomePage() dengan ProductButtonsPage()
                MaterialPageRoute(builder: (context) => const ProductButtonsPage(title: 'Menu Produk')),
              );
            },
          ),
          
          // Opsi Tambah Produk (Persyaratan Dosen)
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pop(context);
              // NAVIGASI: Ke Halaman Form (ProductFormPage)
              Navigator.push(
                context,
                // Ganti pushReplacement dengan push agar bisa kembali
                MaterialPageRoute(builder: (context) => const ProductFormPage()), 
              );
            },
          ),
        ],
      ),
    );
  }
}