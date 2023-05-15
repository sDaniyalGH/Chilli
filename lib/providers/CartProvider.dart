import 'package:flutter/cupertino.dart';

import '../model/Product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product cartItem) {
    // Check if the product is already in the cart
    bool productExistsInCart = _cartItems.any((item) => item.id == cartItem.id);

    if (productExistsInCart) {
      // If the product already exists in the cart, increment its quantity
      _cartItems.forEach((item) {
        if (item.id == cartItem.id) {
          item.setQuantity = (item.quantity + 1);
        }
      });
      print('state 1');
      print(cartItems.toString());
    } else {
      // If the product is not in the cart, add it as a new item
      _cartItems.add(cartItem);
      print('state 2');
      print(cartItems.toString());
    }

    notifyListeners();
  }
}