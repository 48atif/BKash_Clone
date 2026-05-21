import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/balance_model.dart';
import '../models/menu_item_model.dart';
import '../models/service_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';

class DummyDataService {
  static UserModel getUser() {
    return UserModel(
      name: 'Jannat Al Naeem',
      phone: '+880 1921 474117',
      image:
          'https://i.pravatar.cc/300',
    );
  }

  static BalanceModel getBalance() {
    return BalanceModel(
      balance: 25430.50,
      cashback: 1240.00,
      rewards: 220,
    );
  }

  static List<TransactionModel> transactions = [
    TransactionModel(
      title: 'Send Money',
      date: 'Today',
      amount: 500,
    ),
    TransactionModel(
      title: 'Mobile Recharge',
      date: 'Yesterday',
      amount: 300,
    ),
    TransactionModel(
      title: 'Cash Out',
      date: '2 days ago',
      amount: 1000,
    ),
  ];

  static List<MenuItemModel> menuItems = [
    MenuItemModel(title: 'Statements', icon: Iconsax.receipt_item),
    MenuItemModel(title: 'Limit', icon: Iconsax.chart),
    MenuItemModel(title: 'Customer Care', icon: Iconsax.support),
    MenuItemModel(title: 'Settings', icon: Iconsax.setting_2),
    MenuItemModel(title: 'Saved Cards', icon: Iconsax.card),
    MenuItemModel(title: 'Log Out', icon: Iconsax.logout),
  ];

  static List<ServiceModel> services = [
    ServiceModel(title: 'Send Money', icon: Iconsax.send_1),
    ServiceModel(title: 'Cash Out', icon: Iconsax.wallet_2),
    ServiceModel(title: 'Recharge', icon: Iconsax.mobile),
    ServiceModel(title: 'Pay Bill', icon: Iconsax.receipt_2),
    ServiceModel(title: 'Savings', icon: Iconsax.money_recive),
    ServiceModel(title: 'Donation', icon: Iconsax.heart),
  ];
}