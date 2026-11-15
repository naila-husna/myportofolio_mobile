# MyPortfolio Mobile
MyPortfolio Mobile adalah aplikasi portofolio berbasis Flutter yang dibuat untuk mata kuliah Pemrograman Berbasis Platform (PBP). Halaman utama menampilkan identitas mahasiswa dan tiga menu: Lihat Proyek, Tambah Proyek, dan Logout.

## Identitas
**Nama:** Naila Husna Teguh Suasono <br>
**Kelas:** PBP A <br>
**NPM:** 2506620444

## Tampilan dan Menu
Halaman utama memuat AppBar dengan judul **MyPortfolio**, kartu identitas, serta ucapan **Selamat datang di MyPortfolio Mobile!**. Menu disusun dalam tiga kolom dengan ikon dan warna yang berbeda. (Dapat berubah seiring berjalannya waktu, selama waktu pengerjaan mata kulaih masih berlangsung)

| Menu | Ikon | Warna |
| --- | --- | --- |
| Lihat Proyek | Folder | Biru |
| Tambah Proyek | Add circle | Hijau |
| Logout | Logout | Oranye |

Ketika salah satu menu ditekan, aplikasi menampilkan SnackBar dengan pesan `Kamu telah menekan tombol <nama menu>!`. Ketiga menu saat ini belum membuka halaman lain atau menjalankan proses logout.

## Cara Menjalankan
Pastikan Flutter SDK yang digunakan mendukung batas versi Dart pada `pubspec.yaml`, yaitu `^3.13.7`. Siapkan emulator atau perangkat yang sudah terhubung.

1. Buka terminal di direktori proyek.
2. Unduh dependensi aplikasi:

   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi:

   ```bash
   flutter run
   ```

## Struktur Kode
```text
lib/
├── main.dart    # Entry point, konfigurasi tema, dan halaman awal
└── menu.dart    # Halaman utama, kartu identitas, dan kartu menu
```

## Implementasi
1. **Mengatur aplikasi dan tema**

   `main.dart` menjalankan `MyApp` melalui `runApp`. Widget ini mengembalikan `MaterialApp` dengan tema Material 3, warna dasar indigo, dan `MyHomePage` sebagai halaman awal.

2. **Menyusun halaman utama**

   `MyHomePage` di `menu.dart` menggunakan `StatelessWidget`. Tampilan disusun menggunakan `Scaffold`, `AppBar`, `Padding`, dan `Column`.

3. **Menampilkan identitas mahasiswa**

   NPM, nama, dan kelas ditampilkan melalui widget `InfoCard`. Ketiga kartu ditempatkan dalam `Row` dan masing-masing dibungkus `Expanded` agar memperoleh bagian lebar yang sama.

4. **Membuat data dan tampilan menu**

   Class `ItemHomepage` menyimpan nama, ikon, dan warna setiap menu. Daftar menu diubah menjadi widget `ItemCard` dan ditampilkan menggunakan `GridView.count` dengan tiga kolom.

5. **Menambahkan interaksi pada menu**

   Setiap `ItemCard` menggunakan `Material` dan `InkWell` untuk menerima ketukan. Pada `onTap`, `ScaffoldMessenger` menutup SnackBar yang sedang tampil lalu menampilkan pesan sesuai nama menu yang ditekan.
<br>
<br>
--------
### Tugas 7

1. Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-*widget* <br>
**Answer:** Karena *widget tree* memiliki struktur bercabang, dimana satu parent dapat memiliki beberapa *child* yang juga bisa menjadi widget dari parentnya. *Child* beraada di dalam *parent*-nya, tetapi keduanya memiliki fungsi yang berbeda

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing! <br>

**Answer:** <br>

| Widget | Kegunaan |
| --- | --- |
| `MaterialApp` | Konfigurasi aplikasi |
| `Scaffold`, `AppBar` | Kerangka halaman|
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Expanded` | Membagi ruang yang tersedia pada kartu identitas |
| `Center` | Menempatkan widget di tengah |
| `GridView.count` | Menampilkan menu dalam tiga kolom |
| `Padding` | Memberikan jarak di sekitar widget |
| `SizedBox` | Memberikan jarak antarwidget |
| `Container` | Membungkus konten dan mengatur padding |
| `Text` | Menampilkan teks |
| `Icon` | Menampilkan ikon menu |
| `Card` | Menampilkan kartu identitas |
| `Material` | Memberikan warna latar dan sudut melengkung pada kartu menu |
| `InkWell` | Menangani ketukan dan memberikan efek visual saat menu ditekan |
| `SnackBar` | Menampilkan pesan sementara setelah menu ditekan |
| `MyApp` | Widget buatan sendiri untuk mengatur aplikasi |
| `MyHomePage` | Widget buatan sendiri untuk menampilkan halaman utama |
| `InfoCard` | Widget buatan sendiri untuk menampilkan satu kartu identitas |
| `ItemCard` | Widget buatan sendiri untuk menampilkan satu kartu menu |

3. Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!<br>
**Answer**: `MaterialApp` berfungsi untuk konfigurasi aplikasi, lebih tepatnya sebagai pembungkus utama aplikasi Flutter yang menggunakan Material Design. Pada umumnya `MaterialApp` digunakan sebagai root widget pada Flutter karena menyediakan konfigurasi dan fasilitas dasar yang dapat digunakan oleh widget di bawahnya. Sehingga, tampilan dan navigasi aplikasi dapat dikelola secara konsisten

4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya
memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`? <br>
**Answer**: `StatelessWidget`: tidak memiliki *internal state* yang dapat berubah (cocok digunakan untuk teks, ikon, atau yang lainnya yang tidak perlu mengelola perubahan data sendiri) dan `StatefulWidget`: memiliki *state* yang dapat berubah selama aplikasi berjalan (cocok digunakan untuk tampilan yang berubah mengikuti interaksi pengguna)

5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam
metode build? <br>
**Answer**: Objek yang menunjukkan posisi suatu widget di dalam widget tree. Objek ini penting karena memungkinkan widget mengakses data atau fasilitas dari widget *parent*-nya. Dalam metode `build(BuildContext context)`, `context` dapat digunakan untuk mengakses tema melalui `Theme.of(context)`, seperti untuk menentukan warna pada aplikasi

6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita
tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart? <br>
**Answer**: Hot reload menerapkan perubahan kode dan membangun ulang tampilan tanpa menghilangkan state aplikasi yang sedang berjalan. Fitur ini cocok digunakan saat mengubah tampilan, seperti teks, warna, atau tata letak.

<br>

--------
**AI Disclosure** <br>
Dalam proses pengerjaan proyek Flutter ini, saya menggunakan **ChatGPT (OpenAI)** sebagai alat bantu pembelajaran untuk memperdalam pemahaman mengenai konsep-konsep Flutter dan membantu proses *troubleshooting*. Penggunaan AI difokuskan sebagai sarana diskusi dan klarifikasi konsep, bukan sebagai pengganti proses pengerjaan dan pemahaman secara mandiri.

**Tujuan dan Bagian yang Dibantu AI** <br>
Penggunaan ChatGPT dalam pengerjaan proyek ini mencakup beberapa hal berikut: <br>
1. **Pemahaman konsep Flutter:** Membantu menjelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`, terutama terkait pengelolaan *state*, perubahan tampilan, serta kapan masing-masing widget digunakan.
2. **Pemahaman struktur widget:** Membantu memperjelas hubungan antar-widget dalam *widget tree*, termasuk bagaimana widget disusun secara hierarkis untuk membentuk tampilan aplikasi.
3. **Dokumentasi proyek:** Membantu memberikan panduan penulisan Markdown, khususnya untuk menyusun tabel dan merapikan dokumentasi pada `README.md`.
4. **Verifikasi pemahaman:** Digunakan sebagai sarana diskusi untuk mengevaluasi pemahaman pribadi, mengidentifikasi miskonsepsi, dan memperoleh penjelasan tambahan terhadap materi yang belum sepenuhnya dipahami.


**Strategi Prompting** <br>
Strategi *prompting* yang digunakan bersifat **iteratif dan reflektif**. Saya memulai dengan menyampaikan pemahaman awal mengenai suatu konsep, kemudian meminta ChatGPT untuk mengevaluasi, mengoreksi, dan mengelaborasi bagian yang kurang tepat.

Sebagai contoh, ketika mempelajari perbedaan `StatelessWidget` dan `StatefulWidget`, saya terlebih dahulu menyampaikan interpretasi pribadi, kemudian meminta AI untuk menjelaskan lebih lanjut apabila terdapat kesalahan konsep. Setelah memperoleh penjelasan, saya merumuskan kembali pemahaman tersebut menggunakan kata-kata sendiri dan meminta evaluasi ulang.


**Evaluasi Kritis dan Kontribusi Mandiri** <br>
Informasi yang diberikan AI tidak langsung dianggap sebagai jawaban akhir, tetapi digunakan sebagai referensi untuk mengembangkan pemahaman pribadi. Salah satu hasil evaluasi adalah pemahaman bahwa `StatelessWidget` tidak selalu berarti tampilan bersifat statis, melainkan widget tersebut tidak mengelola *mutable state* internalnya sendiri.

Penjelasan dari AI kemudian saya tinjau kembali dan sederhanakan menggunakan bahasa sendiri agar sesuai dengan pemahaman dan konteks proyek. Selain itu, saya juga menjalankan `flutter analyze` untuk memeriksa kode proyek, dengan hasil **No issues found**.

Dengan demikian, ChatGPT berperan sebagai alat bantu pembelajaran dan evaluasi, sedangkan proses memahami konsep, menjalankan pemeriksaan, dan menentukan hasil akhir tetap dilakukan secara mandiri.

**Dokumentasi Interaksi AI** <br>
Contoh prompt yang digunakan:

> "Perbaiki dan elaborate apabila pemahamanku salah, StatelessWidget jadi dia static, kayak tulisan icon, dan StatefulWidget bisa berubah-ubah tergantung user interaction, seperti checkbox."

> "StatelessWidget: tidak memiliki internal state yang dapat berubah [...] dan StatefulWidget: memiliki state yang dapat berubah selama aplikasi berjalan [...]. Bener kan gini?"

> https://chatgpt.com/share/6af98600-6e04-83ec-a02a-571b472de63b