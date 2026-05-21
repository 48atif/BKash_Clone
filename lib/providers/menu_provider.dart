import 'package:flutter/material.dart';

import '../models/menu_item_model.dart';
import '../models/service_model.dart';
import '../services/dummy_data_service.dart';

class MenuProvider extends ChangeNotifier {
  bool isLoading = true;

  List<MenuItemModel> menuItems = [];
  List<ServiceModel> services = [];

  MenuProvider() {
    loadMenu();
  }

  Future<void> loadMenu() async {
    await Future.delayed(const Duration(milliseconds: 800));

    menuItems = DummyDataService.menuItems;
    services = DummyDataService.services;

    isLoading = false;
    notifyListeners();
  }
}