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




TUGAS 8

1. perbedaan navigator.push dan pushreplacement
    navigator.push menumpuk halaman baru, jadi bisa kembali. Contohnya adalah ketika membuka halaman form

    pushreplacement mengganti halaman saat ini, jadi tidak bisa kembali. Contohnya adalah ketika pindah dari halaman login ke halaman utama

2. hierarki Saffold, AppBar, Drawer
    Scaffold adalah kerangka dasar atau bisa saya katakan fondasi untuk satu halaman penuh 

    AppBar adalah bilah judul di bagian atas, ditempatkan di properti AppBar milik Scaffold

    Drawer adalah menu navigasi samping yang akan mengeluarkan menu saat ditekan, ditempatkan di properti drawer milik scaffold

3. kelebihan widget layout pada form
    Padding:L memberikan jarak di sekitar elemen form, jadi terlihat lebih bagus dan mencegah TextFormField menempel di tepi layar. Menurut saya ini adalah kelebihan dalam segi estetika

    terdapat juga kelebihan dalam segi fungsionalitas yaitu ListView.
    ListView (atau SingleChildScrollView) sangat penting agar halaman bisa di-scroll. Saat keyboard muncul, ListView memastikan input field yang ada di bagian bawah tidak tertutup, sehingga pengguna tetap bisa melihat apa yang mereka ketik.

4. Saya mengaturnya di satu tempat terpusat, yaitu di file main.dart.

Di dalam widget MaterialApp, saya menggunakan properti theme dan mengisinya dengan ThemeData. Di sinilah saya menentukan colorScheme untuk brand saya, seperti yang ada di kode saya:

colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)

Dengan mengatur ini, Flutter secara otomatis menerapkan warna biru tersebut ke AppBar, tombol, dan widget lainnya di seluruh aplikasi saya, sehingga tampilannya konsisten.



TUGAS 9

1. Model Dart diperlukan untuk menjamin keamanan tipe data (type safety) dan struktur kode yang rapi. Jika hanya menggunakan Map<String, dynamic>, kita kehilangan validasi otomatis, sehingga kode menjadi rentan error (seperti salah ketik key) dan sulit dikelola (maintain) jangka panjang.

2. Package http berfungsi untuk melakukan request standar yang sifatnya stateless (tidak mengingat sesi). Sebaliknya, CookieRequest dirancang khusus untuk menangani manajemen sesi dengan menyimpan cookies login secara otomatis, yang sangat krusial agar status autentikasi pengguna tetap terjaga saat berinteraksi dengan Django.

3. CookieRequest harus tunggal dan dibagikan ke seluruh aplikasi (biasanya via Provider) agar sesi login konsisten. Jika setiap halaman membuat instance baru, data cookie sesi yang tersimpan akan hilang, menyebabkan pengguna dianggap logout setiap kali berpindah halaman.

4. 10.0.2.2 ditambahkan ke ALLOWED_HOSTS karena itu adalah IP spesial bagi emulator Android untuk mengakses localhost komputer. Pengaturan CORS, SameSite, dan izin internet wajib ada agar pertukaran data dan penyimpanan cookie lintas domain diizinkan. Tanpa ini, aplikasi akan gagal terhubung atau login akan selalu gagal karena cookie ditolak.

5. Data dari input form Flutter dikonversi menjadi JSON dan dikirim via method POST menggunakan CookieRequest ke URL Django. Django menerima, memvalidasi, dan menyimpannya ke database, lalu mengembalikan respon JSON. Flutter membaca respon tersebut untuk memberikan umpan balik ke pengguna (sukses/gagal).

6. Saat login, kredensial dikirim ke Django untuk diverifikasi. Jika valid, Django membuat sesi dan mengirimkan session ID dalam cookie ke Flutter yang disimpan oleh CookieRequest. Selama cookie tersimpan, pengguna berstatus login. Saat logout, sesi dihapus di server dan cookie dihapus di Flutter.

7. Saya memulainya dengan menyiapkan backend Django (View JSON, URL, konfigurasi CORS). Di Flutter, saya memasang Provider CookieRequest di root aplikasi, membuat model Dart dari respon JSON, lalu menghubungkan halaman Login, Register, dan Form Input dengan fungsi request untuk integrasi data antara kedua platform.