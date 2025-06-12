import 'package:flutter/foundation.dart';

class SelectedProductProvider with ChangeNotifier {
  List<int> selectedItems = [];

  void addItems(int value) {
    selectedItems.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    selectedItems.remove(value);
    notifyListeners();
  }
}
