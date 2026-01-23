import 'package:ecommerceapp/pages/intro_page.dart';
import 'package:ecommerceapp/pages/historial_page.dart'; // Importa la página de historial
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});
  void _mostrarDialogoDireccion(BuildContext context) {
    final TextEditingController _controller = TextEditingController(
      text: "Asunción, Paraguay",
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Editar Dirección"),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: "Calle, Nro de casa, Ciudad",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              // Aquí podrías guardar la dirección en un Provider en el futuro
              print("Dirección actualizada: ${_controller.text}");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Dirección guardada correctamente"),
                ),
              );
            },
            child: const Text("Guardar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        // Header con foto, nombre y email
        const Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Emilio Ruiz',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'emilioruiz11@email.com',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // List of profile options
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                _buildProfileItem(
                  Icons.history,
                  'Mis Compras',
                  'Historial de pedidos',
                  context, // Context to navegate
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistorialPage(),
                    ),
                  ),
                ),
                _buildProfileItem(
                  Icons.location_on_outlined,
                  'Mi Dirección',
                  'Asunción, Paraguay',
                  context,
                  () => _mostrarDialogoDireccion(context),
                ),
                _buildProfileItem(
                  Icons.credit_card,
                  'Método de Pago',
                  'Visa **** 1234',
                  context,
                  () {
                    /* Acción futura */
                  },
                ),
                _buildProfileItem(
                  Icons.help_outline,
                  'Soporte',
                  'Centro de ayuda ApplePy',
                  context,
                  () {
                    /* Acción futura */
                  },
                ),

                const SizedBox(height: 20),

                // Botón Cerrar Sesión
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Cerrar Sesión"),
                        content: const Text(
                          "¿Estás seguro de que deseas salir de ApplePy?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IntroPage(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              "Salir",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget to build profile items
  Widget _buildProfileItem(
    IconData icon,
    String title,
    String subtitle,
    BuildContext context,
    VoidCallback onTapAction,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[800]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTapAction, // se ejecuta la navegación
      ),
    );
  }
}
