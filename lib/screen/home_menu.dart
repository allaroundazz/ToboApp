

import 'package:flutter/material.dart';

import 'package:toboapp/widgets/left_drawer.dart'; 

import 'package:toboapp/screen/addproduct_form.dart'; 




class ProductButtonsPage extends StatefulWidget {
  const ProductButtonsPage({super.key, required this.title});

  final String title;

  @override
  State<ProductButtonsPage> createState() => _ProductButtonsPageState();
}

class _ProductButtonsPageState extends State<ProductButtonsPage> {

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.grey[800],
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // MODIFIKASI: Menggunakan VoidCallback untuk aksi
  Widget _buildProductButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed, // Diubah dari String snackBarMessage
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        onPressed: onPressed, // Gunakan aksi yang diberikan
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Tambahkan Drawer
      drawer: const LeftDrawer(), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildProductButton(
              context: context,
              text: "All Products",
              icon: Icons.list_alt,
              color: Colors.blue,
              onPressed: () {
                _showSnackBar(context, "Kamu telah menekan tombol All Products");
              },
            ),

            _buildProductButton(
              context: context,
              text: "My Products",
              icon: Icons.inventory,
              color: Colors.green,
              onPressed: () {
                _showSnackBar(context, "Kamu telah menekan tombol My Products");
              },
            ),

            // NAVIGASI KE HALAMAN FORM (Persyaratan Dosen)
            _buildProductButton(
              context: context,
              text: "Create Product",
              icon: Icons.add_box,
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  // Navigasi ke class ProductFormPage
                  MaterialPageRoute(builder: (context) => const ProductFormPage()), 
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}