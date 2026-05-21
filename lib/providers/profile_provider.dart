import 'package:flutter/material.dart';

import '../models/balance_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';
import '../services/dummy_data_service.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = true;

  late UserModel user;
  late BalanceModel balance;
  List<TransactionModel> transactions = [];

  ProfileProvider() {
    loadProfile();
  }

  Future<void> loadProfile() async {
    await Future.delayed(const Duration(seconds: 1));

    user = DummyDataService.getUser();
    balance = DummyDataService.getBalance();
    transactions = DummyDataService.transactions;

    isLoading = false;
    notifyListeners();
  }
}