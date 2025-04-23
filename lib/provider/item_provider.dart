// lib/provider/item_provider.dart
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  final Set<int> _selectedIndices = {};

  Set<int> get selectedIndices => _selectedIndices;

  void selectItem(int index) {
    if (!_selectedIndices.contains(index)) {
      _selectedIndices.add(index);
      notifyListeners();
    }
  }
}


