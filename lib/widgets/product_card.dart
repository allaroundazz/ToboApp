import 'package.flutter/material.dart';


class NewsCard extends StatelessWidget {
 
  final Map<String, dynamic> product;

  const NewsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Ekstrak data dari map untuk ditampilkan
    final String name = product['name'] ?? 'Produk';
    final double price = product['price'] ?? 0.0;
    final String description = product['description'] ?? 'Tidak ada deskripsi.';
    final String thumbnailUrl = product['thumbnail'] ?? ''; // URL Gambar
    final bool isFeatured = product['isFeatured'] ?? false;

    return Card(
      elevation: 4, // Memberi bayangan
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1. Gambar Produk (Thumbnail)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              thumbnailUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              // Tampilkan ini jika gambar gagal dimuat
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          
          // 2. Detail Produk di dalam Padding
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Nama Produk dan Bintang Featured
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1, // Batasi 1 baris
                        overflow: TextOverflow.ellipsis, // Beri ... jika panjang
                      ),
                    ),
                    if (isFeatured) // Tampilkan bintang jika 'isFeatured' true
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                  ],
                ),
                const SizedBox(height: 4),

                // Harga
                Text(
                  'Rp ${price.toStringAsFixed(0)}', // Format harga
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // Deskripsi Singkat
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2, // Batasi 2 baris
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          
          // 3. Tombol Aksi (Opsional, tapi bagus)
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Aksi untuk lihat detail
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Melihat detail $name')),
                  );
                },
                child: const Text('LIHAT DETAIL'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}