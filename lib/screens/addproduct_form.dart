import 'package:flutter/material.dart';

// Class tetap ProductFormPage
class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  
  String _name = "";
  double _price = 0;
  String _description = "";
  String _thumbnail = ""; // Tambahan dari model Django
  String _category = ""; // Tambahan dari model Django
  bool _isFeatured = false; // Tambahan dari model Django

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Tambah Produk'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Input: Name (Wajib)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Produk (name)'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Nama produk tidak boleh kosong.';
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 12),

              // Input: Price (Wajib + Validasi Angka & Negatif)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harga (price)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Harga tidak boleh kosong.';
                  final price = double.tryParse(value);
                  if (price == null) return 'Masukkan angka yang valid.';
                  if (price < 0) return 'Harga tidak boleh negatif.'; // Peringatan Dosen
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              const SizedBox(height: 12),

              // Input: Description (Wajib + Validasi Minimum Panjang)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi (description)'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Deskripsi tidak boleh kosong.';
                  if (value.length < 10) return 'Deskripsi minimal 10 karakter.'; // Peringatan Dosen
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              const SizedBox(height: 12),

              // Input: Thumbnail (Tambahan + Validasi URL)
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL Thumbnail'),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'URL Thumbnail tidak boleh kosong.';
                  if (!value.startsWith('http')) return 'Harus berupa URL yang valid.'; // Peringatan Dosen
                  return null;
                },
                onSaved: (value) => _thumbnail = value!,
              ),
              const SizedBox(height: 12),

              // Input: Category (Tambahan)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kategori'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Kategori tidak boleh kosong.';
                  return null;
                },
                onSaved: (value) => _category = value!,
              ),
              const SizedBox(height: 12),

              // Input: isFeatured (Tambahan)
              SwitchListTile(
                title: const Text('Produk Unggulan (isFeatured)'),
                value: _isFeatured,
                onChanged: (newValue) {
                  setState(() {
                    _isFeatured = newValue;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Tombol Save (Wajib)
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    
                    // MUNCULKAN DATA ISI FORM DALAM POP-UP (Persyaratan Dosen)
                    String dataPopup = 'Nama: $_name\n'
                        'Harga: $_price\n'
                        'Deskripsi: $_description\n'
                        'Kategori: $_category\n'
                        'Featured: $_isFeatured';

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data Disimpan:\n$dataPopup'),
                        duration: const Duration(seconds: 5),
                      ),
                    );

                    // Kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}