import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class Cart extends ChangeNotifier {
  String _userAddress = "Asunción, Paraguay";
  final List<Product> _purchaseHistory = [];
  final List<Product> _userCart = [];

  // list of products
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

  // getters
  String get userAddress => _userAddress;
  List<Product> get purchaseHistory => _purchaseHistory;
  List<Product> get shop => _shop;
  List<Product> get userCart => _userCart;

  // methods

  // add new adress
  void updateUserAddress(String newAddress) {
    _userAddress = newAddress;
    notifyListeners();
  }

  // Add to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  // remove from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }

  // clean cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }

  // finish purchase
  void completePurchase() {
    _purchaseHistory.addAll(_userCart);
    _userCart.clear();
    notifyListeners();
  }
}
