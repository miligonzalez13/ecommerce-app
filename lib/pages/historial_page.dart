import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class HistorialPage extends StatelessWidget {
  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Compras"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => value.purchaseHistory.isEmpty
            ? const Center(child: Text("Aún no tienes compras realizadas."))
            : ListView.builder(
                itemCount: value.purchaseHistory.length,
                itemBuilder: (context, index) {
                  Product product = value.purchaseHistory[index];
                  return ListTile(
                    leading: Image.asset(product.image, width: 40),
                    title: Text(product.name),
                    subtitle: Text("${product.price} Gs."),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
