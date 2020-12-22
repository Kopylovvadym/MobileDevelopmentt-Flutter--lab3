import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lab3/Api.dart';
import 'package:provider/provider.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<MenuItem> items = [];
  /// An unmodifiable view of the items in the cart.
  //UnmodifiableListView<MenuItem> get items => UnmodifiableListView(items);

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(MenuItem item) {
    items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(MenuItem item) {
    items.remove(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

}