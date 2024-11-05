**Edmond Christian / 2306208363 / PBP D**


<Details open>
<Summary>Tugas 7</Summary>

## Tugas 7

### Jelaskan apa yang dimaksud dengan *stateless widget dan stateful widget*, dan jelaskan perbedaan dari keduanya.
*Stateless widget* pada Flutter adalah *class* widget yang bersifat statik atau setelah dibuat maka komponen-komponennya tidak dapat berubah lagi. Jika ingin "mengubah" *stateless widget* maka perlu dilakukan dari luar objeknya dan biasanya dilakukan dengan membuat ulang widget tersebut dengan nilai atribut yang berbeda. Sementara itu *stateful widget* adalah *class* widget yang setelah dibuat, komponennya tetap dapat mengalami perubahan seperti teksnya berubah, warnanya berubah dan lain-lainnya. Perubahan dari *stateful widget* dapat dilakukan oleh objeknya sendiri, karena widget jenis ini memiliki *state* yang akan menyimpan keadaannya saat itu, saat *state*nya berubah maka ia akan membuat ulang dirinya dengan atribut yang berbeda. Karena sifat *mutable* dari *stateful widget*, widget ini lebih dinamis walaupun memiliki performa yang lebih buruk dari *stateless widget*.

### Sebutkan *widget* apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Widget yang digunakan di proyek ini dapat dibagi 2, yang merupakan widget bawaan Flutter dan widget yang dibuat sendiri pada file-file projek.
Widget buatan:
- MyApp, berfungsi sebagai widget utama untuk menyimpan widget-widget lainnya pada aplikasi.
- MyHomePage, berfungsi sebagai widget untuk halaman *home* aplikasi.
- InfoCard, widget yang digunakan untuk menampilkan teks-teks informasi pada projek ini.
- ItemCard, widget untuk menampilkan tombol-tombol yang saat ini hanya menampilkan *snackbar* yang datanya berasal dari objek ItemHomepage.
  Semua widget yang custom merupakan *stateless widget*
  Widget bawaan dari Flutter:
- MaterialApp, berfungsi sebagai kontainer teratas pada aplikasi dan untuk mengatur strukturnya.
- Scaffold, berfungsi untuk memberikan struktur dasar halaman dengan AppBar dan isi/*body*.
- AppBar, berfungsi untuk menampilkan teks nama aplikasi pada atas halaman.
- Text, berfungsi untuk menampilkan data tertentu dalam bentuk teks.
- Padding, berfungsi untuk memberikan jarak antar widget di aplikasi.
- Column, berfungsi untuk mengatur layout widget secara vertikal.
- Row, berfungsi untuk mengatur layout widget secara horizontal.
- SizedBox, (pada proyek) berfungsi untuk memberikan ruang kosong/spasi vertikal.
- Center, berfungsi untuk memberikan layout widget yang ditempatkan di tengah-tengah secara vertikal ataupun horizontal.
- Gridview, berfungsi untuk memberikan layout widget dalam bentuk grid.
- Container, berfungsi sebagai kontainer untuk widget-widget lainnya.
- MediaQuery, berfungsi untuk mengetahui layar perangkat yang digunakan.
- ScaffoldMessenger, berfungsi untuk menampilkan snackbar.
- Snackbar, berfungsi untuk memunculkan pesan/respons jika suatu tombol dipencet.

### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` fungsi dari *stateful widget* yang dipanggil jika *state* widget tersebut mengalami perubahan, setelah fungsi ini dipanggil maka akan dibuat *request* untuk membuat ulang widgetnya dengan atribut yang berbeda. Variabel yang terdampak adalah variabel *mutable* yang berada pada fungsi `setState()` tersebut dan variabel pada metode `build()`nya yang berubah yang berkaitan dengan *state* widget.

### Jelaskan perbedaan antara `const` dan `final`.
`const` dan `final` adalah variabel yang setelah nilainya diinisialisasi tidak dapat diubah (*immutable*). Perbedaan yang utama adalah kapan nilainya diinisialisasi, variabel `final` nilainya diinisialisasi saat diakses pertama kali saat *runtime* aplikasi, sementara variabel `const` nilainya diinisialisasi saat *compile* aplikasi. Akibatnya terdapat perbedaan kegunaan di antara keduanya, `const` digunakan untuk variabel yang nilainya diketahui saat compile dan akan selalu sama misalnya teks judul dan nama tombol, sementara `final` digunakan untuk variabel yang nilainya tidak konstan untuk setiap kali *runtime* aplikasi, misalnya waktu saat aplikasi dimulai atau nilai dari suatu fungsi lain saat *runtime*.
### Jelaskan bagaimana cara kamu mengimplementasi *checklist-checklist* di atas.

1. Membuat repositori baru di GitHub
2. Pada lokal melakukan `git init` pada suatu folder baru
3. Membuat projek Flutter baru "the_eh_toko_mobile" dengan menggunakan `flutter create the_eh_toko_mobile`
4. Menjalankan aplikasi awal dengan `flutter run` untuk memastikan projek berhasil dibuat.
5. Membuat file `lib/menu.dart`, menambahkan import dari `package:flutter/material.dart`, memindahkan class MyHomePage dan _MyHomePageState dari `main.dart`, dan melakukan import dari `menu.dart` ke `main.dart`.
6. Mengubah warna tema dari aplikasi, mengubah widget halaman menu menjadi stateless dengan mengubah `main.dart` dan `menu.dart`.
7. Membuat widget card untuk menampilkan nama, npm, dan kelas dengan membuat class `Infocard`.
8. Membuat widget card sebagai tombol dengan membuat class `ItemCard`.
9. Menambahkan widget-widget yang sudah dibuat ke dalam class `MyHomepage` untuk ditampilkan.
10. Untuk menampilkan warna-warna yang berbeda untuk button, menambahkan parameter baru pada ItemHomePage yang akan dijadikan warna dari tombol tersebut.

```Dart
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color buttonColor;
  ItemHomepage(this.name, this.icon, this.buttonColor);
}
```

11. Selanjutnya mengganti warna dari tombol yang secara default merupakan warna dari tema aplikasi. (`item` merupakan objek `ItemHomepage` yang telah dibuat sebelumnya).

```Dart
class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
            color: item.buttonColor,
            ...
    )
  }
}
```

</Details>
