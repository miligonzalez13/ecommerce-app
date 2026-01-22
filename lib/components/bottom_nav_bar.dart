import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        color: Colors.grey[600],
        activeColor: Colors.grey[900],
        tabActiveBorder: Border.all(color: Colors.white, width: 1),
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(icon: Icons.home, text: 'Inicio'),
          GButton(icon: Icons.search, text: 'Buscar'),
          GButton(icon: Icons.shopping_cart, text: 'Carrito'),
          GButton(icon: Icons.person, text: 'Perfil'),
        ],
      ),
    );
  }
}
