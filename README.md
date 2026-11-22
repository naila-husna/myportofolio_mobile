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

1. Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-*widget* <br>**Answer:** Karena *widget tree* memiliki struktur bercabang, dimana satu parent dapat memiliki beberapa *child* yang juga bisa menjadi widget dari parentnya. *Child* beraada di dalam *parent*-nya, tetapi keduanya memiliki fungsi yang berbeda


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

<br>
<br>

--------

### Tugas 8

1. Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama. <br>
**Answer:**
- `Navigator.push()`: menambahkan halaman baru ke dalam *navigation stack* tanpa menghapus halaman sebelumnya.
- `Navigator.pushReplacement()`: menggantikan halaman yang sedang ditampilkan dengan halaman baru.
- `Navigator.pop()`: menghapus halaman atau dialog yang berada pada posisi paling atas dalam *navigation stack*, sehingga pengguna dapat kembali ke tampilan sebelumnya.

   Pada proyek ini, saya menggunakan `Navigator.push()` untuk membuka halaman Experience Form melalui kartu Tambah Pengalaman. Sedangkan pada opsi Home di drawer, saya menggunakan `Navigator.pushReplacement()` karena halaman yang sedang ditampilkan akan digantikan dengan halaman utama (`MyHomePage`). Adapun `Navigator.pop()` digunakan untuk menutup dialog ketika pengguna menekan tombol OK.




2. Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman. <br>
**Answer:** `Scaffold` berfungsi sebagai kerangka dasar suatu halaman, dimana di dalamnya terdapat beberapa widget seperti `AppBar`, `Drawer`, dan `body`. `AppBar` berfungsi untuk menampilkan judul halaman, sedangkan `Drawer` berfungsi sebagai menu navigasi antarhalaman.
   
   Dengan menggunakan `LeftDrawer` yang sama pada beberapa halaman, pengguna dapat mengakses menu navigasi yang sama tanpa perlu membuat drawer baru pada setiap halaman. Contoh penggunaan warna yang konsisten pada proyek ini adalah penggunaan `Colors.indigo` pada `AppBar` halaman Add Project dan Add Experience.



3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas. <br>
**Answer:** Saya menggunakan `Column` karena setiap input pada formulir disusun secara vertikal, sehingga pengguna dapat mengisi formulir secara berurutan. Selain itu, saya menggunakan `Padding` untuk memberikan jarak di sekitar masing-masing input agar antarwidget tidak terlalu berdekatan.

   `SingleChildScrollView` digunakan agar pengguna tetap dapat melakukan *scroll* apabila seluruh widget tidak dapat ditampilkan dalam satu layar, misalnya ketika menggunakan perangkat dengan layar kecil atau ketika keyboard sedang ditampilkan. Dengan demikian, seluruh input dan tombol Save tetap dapat dijangkau oleh pengguna.



4. Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup. <br>
**Answer:**
- `GlobalKey<FormState>`: digunakan untuk mengakses dan mengelola *state* dari formulir.
- `validator`: digunakan untuk menentukan kondisi suatu input dapat dikatakan valid atau tidak. Apabila input tidak valid, maka akan mengembalikan pesan error, sedangkan apabila valid akan mengembalikan `null`.
- `validate()`: digunakan untuk menjalankan seluruh validator yang terdapat pada formulir.

   Ketika pengguna menekan tombol Save, `_formKey.currentState!.validate()` akan memeriksa apakah seluruh input sudah memenuhi ketentuan. Apabila seluruh input valid, maka data yang telah dimasukkan akan ditampilkan melalui `AlertDialog`.

   Contohnya, pada input Experience Title, pengguna tidak diperbolehkan memasukkan input kosong, input yang hanya berisi spasi, atau input yang melebihi 255 karakter. Pemilihan jenis input atau keyboard saja belum cukup karena keduanya hanya membantu pengguna dalam memasukkan data, tetapi tidak memastikan bahwa data tersebut sudah memenuhi ketentuan yang ditetapkan.

-----

**AI Disclosure** <br>
Dalam proses pengerjaan Tugas 8 ini, saya menggunakan **ChatGPT (OpenAI)** sebagai alat bantu pembelajaran untuk memperdalam pemahaman mengenai penggunaan widget dan ikon pada Flutter. Penggunaan AI difokuskan sebagai sarana diskusi dan klarifikasi terhadap konsep yang belum sepenuhnya saya pahami.

**Tujuan dan Bagian yang Dibantu AI** <br>
Penggunaan ChatGPT dalam pengerjaan proyek ini mencakup beberapa hal berikut: <br>

1. **Pemahaman penggunaan ikon:** Membantu menjelaskan fungsi `Icons` pada Flutter, khususnya dalam mengakses kumpulan ikon bawaan Material Design tanpa perlu mengunduh gambar secara manual.
2. **Pemahaman perbedaan `Icon` dan `Icons`:** Membantu memperjelas bahwa `Icon` merupakan widget yang digunakan untuk menampilkan ikon, sedangkan `Icons` menyediakan data ikon (`IconData`) yang menentukan bentuk ikon tersebut.
3. **Pemahaman properti widget:** Membantu menjelaskan penggunaan `color`, `size`, `prefixIcon`, dan `suffixIcon` untuk mengatur tampilan serta posisi ikon.
4. **Penerapan ikon pada formulir:** Membantu memahami penggunaan `Icons.calendar_today` sebagai penanda bahwa suatu input berkaitan dengan pemilihan tanggal.


**Strategi Prompting** <br>
Strategi *prompting* yang digunakan bersifat **eksploratif dan kontekstual**. Ketika menemukan suatu bagian kode yang belum saya pahami, saya meminta ChatGPT untuk menjelaskan fungsi dari bagian tersebut beserta contoh penggunaannya.

Sebagai contoh, ketika membuat input tanggal pada Experience Form, saya menemukan penggunaan `Icons.calendar_today`. Saya kemudian meminta AI untuk menjelaskan fungsi `Icons` serta perbedaannya dengan widget `Icon`.


**Evaluasi Kritis dan Kontribusi Mandiri** <br>
Informasi yang diberikan AI digunakan sebagai referensi untuk mengembangkan pemahaman pribadi mengenai penggunaan ikon pada Flutter.

Salah satu hasil pembelajaran adalah pemahaman bahwa `Icons.calendar_today` hanya menentukan bentuk ikon yang ditampilkan dan tidak secara otomatis menjalankan fungsi pemilihan tanggal. Untuk menampilkan kalender, diperlukan fungsi `showDatePicker()` yang dipanggil ketika pengguna melakukan suatu interaksi.

Pemahaman tersebut kemudian saya terapkan pada Experience Form dengan menggunakan `Icon(Icons.calendar_today)` sebagai `trailing` pada widget `ListTile`, sedangkan fungsi `showDatePicker()` dipanggil melalui `onTap`.

Dengan demikian, ChatGPT berperan sebagai alat bantu pembelajaran dan klarifikasi konsep, sedangkan penerapan pada kode dan pengujian aplikasi dilakukan oleh saya.


**Dokumentasi Interaksi AI** <br>
Contoh prompt yang digunakan:

> "kalau datetime itu, untuk di class experienceformpagestate itu tuh sama kayak sebelum-sebelumnya kah untuk buildernya"

> [Dokumentasi interaksi AI](https://chatgpt.com/share/6b02980d-4fbc-83ec-b145-56a0a39a83d5)