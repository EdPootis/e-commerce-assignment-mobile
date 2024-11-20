import 'package:flutter/material.dart';
import 'package:the_eh_toko_mobile/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // tidak memakai left drawer agar muncul tombol back
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Image.network(
                // GANTI URL
                "http://10.0.2.2:8000/media/" + product.fields.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.fields.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: ${product.fields.price}",
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            Text(
              "Stock: ${product.fields.stock}",
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}