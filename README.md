# toboapp

Widget Tree merupakan arsitektur fundamental di Flutter, merepresentasikan seluruh User Interface (UI) sebagai sebuah hierarki.
Pada dasarnya, seluruh elemen visual dalam aplikasi, mulai dari tata letak hingga komponen terkecil (seperti ikon dan teks), adalah
widget yang tersusun layaknya struktur pohon.


Dalam proyek ini widget yang saya gunakan antara lain MaterialApp sebagai widget akar yang menyediakan konteks tema dan routing aplikasi,
Scaffold sebagai kerangka utama visual halaman, Column untuk menyusun widget secara horizontal, Center untuk membuat konten utama berada
di tengah,  dan Elevatedbutton.icon sebagai bentuk interaktif ketika ingin menekan button.

MaterialApp adalah widget pembungkus utama yang berfungsi mengimplementasikan Material Design, sehingga menjadi widget root yang esensial. 
Fungsi utamanya mencakup penyediaan ThemeData untuk konsistensi warna dan tipografi di seluruh aplikasi, serta manajemen routing (navigasi) antar 
halaman.

Perbedaan mendasar antara keduanya terletak pada manajemen state (keadaan). StatelessWidget bersifat tidak dapat diubah setelah dibuat;
widget ini digunakan untuk komponen statis yang tampilannya tidak akan berubah selama runtime aplikasi . Sebaliknya, StatefulWidget digunakan untuk
komponen dinamis yang harus diperbarui di layar sebagai respons terhadap input pengguna atau perubahan data . Dalam proyek ini, kita menggunakan
StatefulWidget (ProductButtonsPage) karena widget tersebut perlu memanggil fungsi setState() untuk menampilkan SnackBar saat tombol diinteraksi, 
meskipun state yang berubah adalah side effect (munculnya SnackBar) dan bukan perubahan tampilan internal widget itu sendiri.


BuildContext adalah referensi atau pegangan ke lokasi widget dalam Widget Tree. Setiap widget memiliki context sendiri. BuildContext sangat penting
karena ia memungkinkan widget untuk: a) Mengakses data dan layanan dari parent yang lebih tinggi di pohon,  Berinteraksi dengan sistem Flutter.
Karena setiap widget perlu mengetahui lokasinya dan mengakses sumber daya di sekitarnya, maka argumen context wajib disertakan dalam setiap metode 
build(BuildContext context).

Hot Reload adalah fitur yang sangat cepat (hampir instan) untuk melihat perubahan kode UI dan logika minor tanpa kehilangan state (keadaan) aplikasi saat ini.
Hot Restart adalah proses yang lebih lambat, yang mengatur ulang seluruh aplikasi dari awal (mengeksekusi ulang main()), sehingga state aplikasi (semua data dan variabel) akan hilang dan direset ke nilai awal.