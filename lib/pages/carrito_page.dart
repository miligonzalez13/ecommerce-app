import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Mi Carrito',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            //List of items in the cart
            Expanded(
              //if the cart is empty, show a message
              child: value.userCart.isEmpty
                  ? const Center(child: Text('Tu carrito está vacío'))
                  : ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        //we get the individual product
                        Product individualProduct = value.userCart[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              individualProduct.image,
                              width: 50,
                            ),
                            title: Text(
                              individualProduct.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text('${individualProduct.price} Gs.'),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                //delete item from cart
                                value.removeItemFromCart(individualProduct);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),

            //button to pay if the cart is not empty
            if (value.userCart.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0, top: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Pagar Ahora',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
