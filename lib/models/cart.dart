import 'package:flutter/material.dart';

//Structure of a product
class Product {
  final String name;
  final String price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class Cart extends ChangeNotifier {
  //List of products available in the shop
  final List<Product> _shop = [
    Product(
      name: 'iPhone 16 Normal',
      price: '5.500.000',
      image: 'lib/images/iphone16.webp',
    ),
    Product(
      name: 'iPhone 16 Pro',
      price: '6.800.000',
      image: 'lib/images/iphone16pro.jpg',
    ),
    Product(
      name: 'iPhone 15 128GB',
      price: '4.200.000',
      image: 'lib/images/celular-apple-iphone-15-128gb-chip.jpg',
    ),
    Product(
      name: 'iPhone 17 Pro Max',
      price: '10.850.000',
      image: 'lib/images/iphone17promax.webp',
    ),
  ];

  //List of products in the user's cart
  final List<Product> _userCart = [];

  //Getters to access the lists
  List<Product> get shop => _shop;
  List<Product> get userCart => _userCart;

  //Add item to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  //Remove item from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }
}
