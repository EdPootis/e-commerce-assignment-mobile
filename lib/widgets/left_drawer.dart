import 'package:flutter/material.dart';
import 'package:the_eh_toko_mobile/screens/menu.dart';
import 'package:the_eh_toko_mobile/screens/newproduct_form.dart';
import 'package:the_eh_toko_mobile/screens/list_product.dart';

// import 'package:the_eh_toko_mobile/screens/menu.dart';
// import 'package:the_eh_toko_mobile/screens/moodentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'The Eh-Toko',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "The Toko for all of your Eh-lectronic needs!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  )
                ),
              ],
            ),

          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Tambah Produk'),
              // Bagian redirection ke NewProductFormPage
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewProductFormPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cable),
              title: const Text('Product List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListProductPage()),
                );
              })
        ],
      ),
    );
  }
}