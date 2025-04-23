import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(Map<String, dynamic> item) {
    if (!_cartItems.contains(item)) {
      _cartItems.add(item);
      notifyListeners();
    }
  }
}
