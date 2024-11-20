import 'package:flutter/material.dart';
import 'package:the_eh_toko_mobile/models/product.dart';
import 'package:the_eh_toko_mobile/screens/product_detail.dart';
import 'package:the_eh_toko_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key});

  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  Future<List<Product>>? fetchProduct(CookieRequest request) async {
    // TODO Ganti URL 
    final response = await request.get('http://10.0.2.2:8000/json/');
    
    // decode response menjadi json
    var data = response;

    // konversi data json menjadi object Produk
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return const Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'There is no product yet on The Eh-Toko',
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 23, 55, 77))
                ),
                SizedBox(height: 8)
              ],
            );
            } else { 
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container (
                    margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.description}"),
                        const SizedBox(height: 10),
                        Text("Price: ${snapshot.data![index].fields.price}"),
                        const SizedBox(height: 10),
                        Text("Stock: ${snapshot.data![index].fields.stock}"),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(product: snapshot.data![index]),
                              ),
                            );
                          },
                          child: const Text('View Details'),
                        ),

                      ],
                    ),
                  ),
                )
              ); 
            } 
          }
        },
      ),
    );
  }
}