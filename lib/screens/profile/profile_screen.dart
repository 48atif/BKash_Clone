import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../providers/profile_provider.dart';

import '../../widgets/profile_header.dart';
import '../../widgets/balance_card.dart';
import '../../widgets/transaction_card.dart';
import '../../widgets/setting_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {

        if (provider.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.background,

          appBar: AppBar(
            backgroundColor: AppColors.primary,

            title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            actions: [

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                ProfileHeader(
                  user: provider.user,
                ),

                const SizedBox(height: 20),

                BalanceCard(
                  balance: provider.balance,
                ),

                const SizedBox(height: 24),

                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                ListView.builder(
                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  itemCount:
                      provider.transactions.length,

                  itemBuilder: (context, index) {

                    final transaction =
                        provider.transactions[index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),

                      child: TransactionCard(
                        transaction: transaction,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                const SettingTile(
                  icon: Icons.person_outline,
                  title: 'Account Information',
                ),

                const SettingTile(
                  icon: Icons.security,
                  title: 'Privacy & Security',
                ),

                const SettingTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),

                const SettingTile(
                  icon: Icons.lock_outline,
                  title: 'Change PIN',
                ),

                const SettingTile(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                ),

                const SettingTile(
                  icon: Icons.logout,
                  title: 'Logout',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}