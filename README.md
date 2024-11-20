**Edmond Christian / 2306208363 / PBP D**


<Details>
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

<Details>
<Summary>Tugas 8</Summary>

## Tugas 8

### Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
`const` digunakan untuk menandakan sebuah variabel agar nilainya tidak dapat diubah setelah diinisialisasikan (*immutable*), di mana nilainya sudah diketahui saat dilakukan *compile*.  Keuntungannya adalah untuk membuat variabel yang *immutable* dan lebih efisien/optimal jika dibandingkan dengan `final` (yang juga digunakan untuk membuat variabel *immutable*) karena Flutter dapat mengoptimisasi nilai dari `const` yang tidak akan berubah selama *runtime*. `const` sebaiknya digunakan untuk menentukan nilai suatu variabel yang sudah diketahui saat di*compile*, seperti nilai dari widget *stateless* ataupun variabel yang nilainya tidak akan berubah. Sementara `const` sebaiknya tidak digunakan untuk variabel yang nilainya tidak diketahui saat aplikasi di*compile* atau dapat berubah saat *runtime* aplikasi, misalkan waktu saat aplikasi dibuka, data dari sebuah API, atau variabel yang nilainya bergantung dari suatu input.

### Jelaskan dan bandingkan penggunaan *Column* dan *Row* pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` merupakan widget yang berfungsi untuk mengatur layout tampilan widget lainnya, `Column` akan menempatkan "children"nya atau widget anaknya secara vertikal/ke atas-bawah pada satu kolom, sementara `Row` akan menampilkannya secara horizontal/ke samping pada satu baris.

Contoh implementasi `Column` yang akan menampilkan 2 `TextFormField` yang disusun secara vertikal.
```dart
Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(...),
                ...
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(...),
                ...
              ),
            ],
          )
```

Contoh implementasi `Row` yang digunakan pada tugas, yang menampilkan 3 *infocard* yang disusun secara horizontal.
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```


### Sebutkan apa saja elemen input yang kamu gunakan pada halaman *form* yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen input yang digunakan pada halaman *form* yang dibuat adalah `TextFormField`, gunanya untuk memasukan/input teks pada halaman formulir, yang jika ingin datanya berupa angka saja atau memiliki syarat lainnya maka dilakukan pada validasi isinya. Selain itu ada juga widget lain yang merupakan elemen input yang tidak digunakan, yaitu:
- `Checkbox`, untuk menginput pilihan *true*/*false*.
- `Radio`, untuk menginput 1 pilihan dari berbagai pilihan. 
- `Switch`, untuk mengaktifkan/menonaktifkan suatu pengaturan ataupun status.
- `Slider`, untuk menginput sebuah nilai angka pada suatu interval.
- `DropdownButtonFormField`, untuk memilih suatu nilai yang sudah ditentukan dari sebuah *dropdown* menu.
- `DatePicker`, untuk menginput suatu tanggal pada tampilan kalender.
- `TimePicker`, untuk menginput suatu waktu pada tampilan jam.

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Cara saya mengatur tema dalam aplikasi Flutter agar konsisten adalah melalui `theme` pada widget `myApp` di`main.dart`. `theme` berisi data tema yang dapat saya atur seperti warna utama/primer, warna sekunder, tipografi, dan pengaturan mengenai *style* yang lainnya. Untuk sekarang tema yang baru saya implementasikan hanyalah warna aplikasi yang diubah sehingga bernuansa biru, seperti website e-commerce yang telah dibuat sebelumnya.

```dart
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blue[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
```

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Cara saya menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter adalah dengan menggunakan widget stateful `Navigator`. Cara untuk berpindah halaman/layar pada aplikasi Flutter adalah untuk melakukan `Push()`, `Pop()`, atau `PushReplacement()`. Sesuai nama fungsinya, navigasi di Flutter seperti sebuah struktur *stack* di mana layar yang dilihat pengguna adalah layar yang berada pada atas *stack*. `Pop()` digunakan untuk mengembalikan layar ke layar sebelumnya, `Push()` untuk membuka layar yang baru dan menambahkannya ke dalam *stack*, `PushReplacement()` juga membuka layar yang baru tetapi caranya adalah dengan menggantikan layar yang berada di atas *stack* dengan layar yang baru, sehingga tidak dapat dilakukan kembali ke halaman yang tepat sebelumnya. Ada beberapa *method* lain yang digunakan pada `Navigator` yaitu, `popUntil()`, `canPop()`, dan `maybePop()`. Selain menggunakan widget `Navigator`, juga terdapat widget `Router` yang digunakan untuk melakukan navigasi yang lebih kompleks atau melakukan *deep link*.


</Details>

<Details open>
<Summary>Tugas 9</Summary>

## Tugas 9
###  Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Pembuatan model pada Flutter yang digunakan untuk pengambilan dan pengiriman data JSON memastikan data yang diambil konsisten dan memiliki semua atribut yang sesuai seperti pada model aplikasi Djangonya. Pembuatan model juga lebih rapih dan memudahkan melakukan pengambilan/pengiriman dibandingkan tanpa suatu model.
Pengambilan data JSON yang tidak menggunakan model dapat dilakukan namun akan muncul beberapa masalah seperti saat melakukan proses validasi  atau pengolahan data JSON mungkin akan mengakses atribut yang tidak ada pada data atau tipe data yang berbeda, selain itu kode akan tampil lebih berantakan jika tidak digunakan suatu model.

###  Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` umumnya digunakan untuk meng*handle* *HTTP request*. Pada tugas ini library `http` berada pada library `pbp_django_auth` sehingga tidak diimport langsung. Kegunaannya pada tugas ini adalah untuk melakukan berbagai *HTTP request*, *request GET* untuk melakukan *fetching* data dari aplikasi Django, *request POST* untuk membuat model produk melalui Flutter dan melakukan otentikasi. Pada setiap *request* tersebut juga disertakan data tambahan yang diperlukan seperti data JSON jika melakukan penambahan produk.

###  Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Class `CookieRequest` adalah class kustom dari library `pbp_django_auth`, class ini digunakan untuk menyimpan dan mengelola cookie aplikasi Flutter berdasarkan data yang didapat dari server. Selanjutnya pada setiap *http request* akan disertakan data tambahan berupa *cookie* yang tersimpan yang datanya dapat berupa pengguna yang sedang *logged in*/sudah terotentikasi sehingga tanpanya tidak diketahui jika pengguna sekarang sudah melakukan login atau tidak. Instance `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter agar status pengguna yang sedang login diketahui/selalu aktif pada semua layar aplikasi (selama pengguna tidak logout), selain itu hal ini juga memudahkan pengambilan data dari *cookie* jika diperlukan pada beberapa bagian/layar aplikasi dan memastikan *cookie* seluruh aplikasi konsisten.

###  Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Setelah input pengguna dan validasi pada suatu *form* atau elemen input lainnya (di tugas ini berada pada `newproduct_form.dart`), akan dilakukan sebuah *request POST* pada website aplikasi Django yang dilengkapi dengan *header* dan *body* yang sesuai.
```dart
...
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                          "http://10.0.2.2:8000/create-flutter/",
                          jsonEncode(<String, String> {
                            'name': _name,
                            'description': _description,
                            'stock': _stock.toString(),
                            'price': _price.toString(),
                            'image': _image,
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).
                              showSnackBar(const SnackBar(
                              content: Text("Product baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                        } else {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                              content:
                              Text("Terdapat kesalahan, silakan coba lagi."),
                            ));
                          }
                        }
                      }
                    }
...
```
Selanjutnya aplikasi Django akan menerima *request* tersebut dan men*handle*nya di fungsi `add_product_flutter` yang kemudian akan memvalidasi url gambar untuk produk (karena model pada Django memiliki objek gambar) agar gambar tersebut dapat diambil dan disimpan ke dalam objek produk, untuk atribut objek produk lainnya langsung di*set* karena sebelumnya sudah dilakukan validasi pada Flutter. Setelah fungsi ini selesai maka akan memberikan respon berupa status penambahan produk berhasil atau terjadi error dalam bentuk JSON.

Untuk menampilkan data di Flutter akan dilakukan *request GET* pada aplikasi Django yang mengembalikan respon berupa data objek dalam bentuk JSON. Lalu digunakan fungsi `productFromJson` dari `product.dart` yang akan mengubah data objek produk JSON menjadi objek pada Flutter. Selanjutnya objek produk dapat ditampilkan atribut-atributnya pada aplikasi Flutter.


### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Register:<br>
Proses autentikasi dimulai dari pendaftaran akun pengguna pada Flutter pada layar `register.dart`, setelah pengguna mengisi *username* dan password maka akan dilakukan request terhadap suatu *address* pada aplikasi Django `http://10.0.2.2:8000/auth/register/` yang akan memberikan respon apakah proses register berhasil atau tidak.
Pada Django dibuat fungsi baru `register` pada `authentication/views.py` untuk membuat pengguna baru pada Django yang memberikan respon `JsonResponse` yang berisi hasil registrasi. Setelah itu tentu dilakukan routing sesuai yang sesuai pada `urls.py` folder *authentication* (dan folder proyek jika belum).

Login:<br>
Jika ada pengguna yang terdaftar (melalui Django ataupun Flutter), maka dapat dilakukan login pada aplikasi Flutter. Setelah mengisi data *username* dan *password* dan memencet tombol login akan dilakukan lagi *request* terhadap aplikasi Django di `http://10.0.2.2:8000/auth/login/`. Di Django ada fungsi `login` pada `authentication/views.py` yang akan meng*handle* login pengguna, jika pengguna dengan *username* dan *password* yang diinput ada maka akan diberikan respon status sukses. Setelah itu, maka layar pada Flutter akan diubah menjadi `MyHomePage`.

Logout:<br>
Proses logout pada Flutter disediakan pada tombol di `MyHomePage`. Setelah dipencet maka dilakukan request terhadap aplikasi Django di `http://10.0.2.2:8000/auth/logout/`. Di Django dibuat fungsi `logout` di `authentication/views.py` yang jika pengguna berhasil logout maka diberikan response username, status, dan pesan "Logout berhasil!". Jika tidak maka diberikan respon yang berbeda. Setelah logout berhasil layar pada Flutter akan di*redirect* ke halaman `LoginPage` dan melakukan reset dari navigasi layar Flutter (agar tombol *back* tidak muncul) 

Fungsi-fungsi tersebut di Django dibuat pada aplikasi khusus `authentication` dan digunakan modul `django.contrib.auth` untuk memudahkan proses otentikasi pada proyek Django.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara *step-by-step*!
1. Pada proyek Django, membuat *app* baru yaitu authentication dan melakukan pengaturan yang sesuai pada `settings.py` folder proyek.
2. Menginstall modul `django-cors-headers` dan melakukan pengaturan yang sesuai.
3. Membuat fungsi pada `authentications/views.py` untuk mengatur login pengguna dan melakukan routing login pada url proyek dan aplikasi.
4. Pada proyek Flutter menginstall package `provider` dan `pbp_django_auth`.
5. Pada `main.dart` mengubah widget utama menjadi provider dari yang awalnya merupakan sebuah MaterialApp untuk membuat instance `CookieRequest` untuk seluruh aplikasi.
6. Membuat layar login baru di `lib/screens/login.dart` dan mengganti layar saat aplikasi berjalan dengan layar login.
7. Pada Django, membuat fungsi baru `register` pada `authentication/views.py` untuk meng-*handle* register pengguna kemudian melakukan routingnya.
8. Pada Flutter, membuat `lib/register.dart` yang akan berisi layar untuk register pengguna.
9. Memastikan login dan register aplikasi berfungsi dengan baik melalui flutter.
10. Membuat model kustom yang sesuai dengan model Django melalui website Quicktype, dengan menggunakan data Json website Django.
11. Memasukkan kode yang didapatkan dari Quickshare ke file baru `lib/models/product.dart`.
12. Menginstall package `http` pada proyek Flutter dan memperbolehkan akses internet oleh aplikasi Flutter.
13. Membuat file `lib/screens/list_product.dart` yang akan melakukan fetch data dari aplikasi Django dan menampilkannya. Di dalamnya setelah dilakukan fetch data, akan ditampilkan berdasarkan filter user yang sedang login
14. Menambahkan redirect ke halaman `ListProductPage` pada *left drawer* dan tombol "Lihat Daftar Produk".
15. Mengetes tampilan halaman daftar produk yang menampilkan produk dari aplikasi Django.
16. Pada proyek Django, membuat fungsi baru pada `main/views.py` untuk menambahkan produk melalui aplikasi Flutter, kemudian melakukan routing untuk fungsi tersebut. (Diubah juga url gambar dari form Flutter menjadi objek gambar pada Django).
17. Pada proyek Flutter, ubah tombol *save* pada halaman form yang sudah dibuat sebelumnya sehingga melakukan request ke aplikasi Django dan produk tersimpan.
18. Untuk membuat fitur logout pada Flutter, dibuat dulu fungsi `logout` pada proyek Django di `authentication/views.py` serta routingnya.
19. Pada proyek Flutter, menambahkan request yang dapat dilakukan pada tombol kartu, dan mengubah tombol "Logout" sehingga saat dipencet pengguna sekarang akan logout dan akan ke layar login.
20. Untuk membuat halaman detail produk, dibuat file baru `lib/screens/detail_product.dart` yang menerima parameter berupa objek product. Di dalamnya berisi *AppBar* yang menampilkan nama produk, lalu di bawahnya adalah widget *Colun* yang berisi nama produknya lagi, gambar produk, deskripsi produk, harga produk, dan stok produk.
21. Setelah memastikan aplikasi Django dan Flutter berjalan pada localhost, dilakukan deployment Django yang terbaru.

</details>