import 'package:ecommerceapp/components/bottom_nav_bar.dart';
import 'package:ecommerceapp/pages/buscar_page.dart';
import 'package:ecommerceapp/pages/carrito_page.dart';
import 'package:ecommerceapp/pages/intro_page.dart';
import 'package:ecommerceapp/pages/perfil_page.dart';
import 'package:ecommerceapp/pages/shop_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this is to manage the bottom navigation bar
  int selectedIndex = 0;
  //this method is to navigate between the pages
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> pages = [
    const ShopPage(),
    const BuscarPage(),
    const CarritoPage(),
    const PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(Icons.menu, color: Colors.black),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            //logo
            DrawerHeader(
              child: Image.asset(
                'lib/images/images.png',
                height: 70,
                width: 70,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: Colors.grey[300]),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: const Text(
                  'Inicio',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.black),
                title: Text(
                  'Acerca de',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context); // Cerramos el drawer
                  showAboutDialog(
                    context: context,
                    applicationName: 'ApplePy',
                    applicationVersion: '1.0.0',
                    applicationIcon: Image.asset(
                      'lib/images/images.png',
                      width: 50,
                      height: 50,
                    ),
                    applicationLegalese: '© 2026 ApplePy Paraguay',
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'La mejor tienda de tecnología premium en Paraguay. '
                          'Ofrecemos productos originales con garantía oficial.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
