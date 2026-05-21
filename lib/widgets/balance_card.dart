import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/balance_model.dart';

class BalanceCard extends StatelessWidget {
  final BalanceModel balance;

  const BalanceCard({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.primary,

        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          const Text(
            'Available Balance',

            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            '৳ ${balance.balance}',

            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              _buildItem(
                'Cashback',
                '৳ ${balance.cashback}',
              ),

              _buildItem(
                'Rewards',
                '${balance.rewards}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String title,
    String value,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          title,

          style: const TextStyle(
            color: Colors.white70,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,

          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}