import 'package:flutter/material.dart';

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

  Widget _buildProductButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Color color,
    required String snackBarMessage,
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
        onPressed: () {
          _showSnackBar(context, snackBarMessage);
        },
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
              snackBarMessage: "Kamu telah menekan tombol All Products",
            ),

            _buildProductButton(
              context: context,
              text: "My Products",
              icon: Icons.inventory,
              color: Colors.green,
              snackBarMessage: "Kamu telah menekan tombol My Products",
            ),

            _buildProductButton(
              context: context,
              text: "Create Product",
              icon: Icons.add_box,
              color: Colors.red,
              snackBarMessage: "Kamu telah menekan tombol Create Product",
            ),
          ],
        ),
      ),
    );
  }
}