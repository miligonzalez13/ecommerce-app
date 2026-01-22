import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  // Function to process purchase
  void _pagarAhora(BuildContext context, Cart cart) {
    // Show circle of charging
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          const Center(child: CircularProgressIndicator(color: Colors.black)),
    );

    // 2. show a 2 secs delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);

      //saving purchase on history
      cart.completePurchase();

      // 4. success message
      showAboutDialog(
        context: context,
        applicationName: 'ApplePy',
        applicationIcon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 50,
        ),
        children: [
          const Text('¡Compra Exitosa!'),
          const Text(
            'Tu pedido ha sido procesado correctamente. ¡Gracias por elegir ApplePy!',
          ),
        ],
      );
    });
  }

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

            // list of items in the car
            Expanded(
              child: value.userCart.isEmpty
                  ? const Center(child: Text('Tu carrito está vacío'))
                  : ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
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
                                value.removeItemFromCart(individualProduct);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // button to pay if cart is not empty
            if (value.userCart.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0, top: 10),
                child: GestureDetector(
                  onTap: () => _pagarAhora(context, value),
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
              ),
          ],
        ),
      ),
    );
  }
}
