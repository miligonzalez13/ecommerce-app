import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        //header with profile picture, name and email
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

        //List of profile options
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                _buildProfileItem(
                  Icons.history,
                  'Mis Compras',
                  'Historial de pedidos',
                ),
                _buildProfileItem(
                  Icons.location_on_outlined,
                  'Mi Dirección',
                  'Asunción, Paraguay',
                ),
                _buildProfileItem(
                  Icons.credit_card,
                  'Método de Pago',
                  'Visa **** 1234',
                ),
                _buildProfileItem(
                  Icons.help_outline,
                  'Soporte',
                  'Centro de ayuda ApplePy',
                ),

                const SizedBox(height: 20),

                //Logout option
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // Lógica para salir
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget to build individual profile items
  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
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
        onTap: () {
          // Navegar a la sección correspondiente
        },
      ),
    );
  }
}
